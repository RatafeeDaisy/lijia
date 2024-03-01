# coding = utf-8

# 推荐算法实现
import csv
import pymysql
import math
from operator import itemgetter


class UserBasedCF():
    # 初始化相关参数
    def __init__(self):
        # 找到与目标用户兴趣相似的3个用户，为其推荐10部景点
        self.n_sim_user = 4
        self.n_rec_scenic = 5

        self.dataSet = {}

        # 用户相似度矩阵
        self.user_sim_matrix = {}
        self.scenic_count = 0

        print('Similar user number = %d' % self.n_sim_user)
        print('Recommneded scenic number = %d' % self.n_rec_scenic)


    # 读文件得到“用户-景点”数据
    def get_dataset(self, filename, pivot=0.75):
        dataSet_len = 0
        for line in self.load_file(filename):
            user, scenic, rating = line.split(',')
            # if random.random() < pivot:
            self.dataSet.setdefault(user, {})
            self.dataSet[user][scenic] = rating
            dataSet_len += 1
            # else:
            #     self.testSet.setdefault(user, {})
            #     self.testSet[user][scenic] = rating
            #     testSet_len += 1
        print('Split trainingSet and testSet success!')
        print('dataSet = %s' % dataSet_len)


    # 读文件，返回文件的每一行
    def load_file(self, filename):
        with open(filename, 'r') as f:
            for i, line in enumerate(f):
                if i == 0:  # 去掉文件第一行的title
                    continue
                yield line.strip('\r\n')
        print('Load %s success!' % filename)


    # 计算用户之间的相似度
    def calc_user_sim(self):
        # 构建“景点-用户”倒排索引
        # key = scenicID, value = list of userIDs who have seen this scenic
        print('Building scenic-user table ...')
        scenic_user = {}
        for user, scenics in self.dataSet.items():
            for scenic in scenics:
                if scenic not in scenic_user:
                    scenic_user[scenic] = set()
                scenic_user[scenic].add(user)
        print('Build scenic-user table success!')

        self.scenic_count = len(scenic_user)
        print('Total scenic number = %d' % self.scenic_count)

        print('Build user co-rated scenics matrix ...')
        for scenic, users in scenic_user.items():
            for u in users:
                for v in users:
                    if u == v:
                        continue
                    self.user_sim_matrix.setdefault(u, {})
                    self.user_sim_matrix[u].setdefault(v, 0)
                    self.user_sim_matrix[u][v] += 1
        print('Build user co-rated scenics matrix success!')

        # 计算相似性
        print('Calculating user similarity matrix ...')
        for u, related_users in self.user_sim_matrix.items():
            for v, count in related_users.items():
                self.user_sim_matrix[u][v] = count / math.sqrt(len(self.dataSet[u]) * len(self.dataSet[v]))
        print('Calculate user similarity matrix success!')


    # 针对目标用户U，找到其最相似的K个用户，产生N个推荐
    def recommend(self, user):
        K = self.n_sim_user
        N = self.n_rec_scenic
        rank = {}
        watched_scenics = self.dataSet[user]

        # v=similar user, wuv=similar factor
        for v, wuv in sorted(self.user_sim_matrix[user].items(), key=itemgetter(1), reverse=True)[0:K]:
            for scenic in self.dataSet[v]:
                if scenic in watched_scenics:
                    continue
                rank.setdefault(scenic, 0)
                rank[scenic] += wuv
        return sorted(rank.items(), key=itemgetter(1), reverse=True)[0:N]


    # 产生推荐并通过准确率、召回率和覆盖率进行评估
    def evaluate(self):
        print("Evaluation start ...")
        N = self.n_rec_scenic
        # 准确率和召回率
        hit = 0
        rec_count = 0
        test_count = 0
        # 覆盖率
        all_rec_scenics = set()

        # 打开数据库连接
        db = pymysql.connect(host='localhost', user='root', password='123456', database='travel', charset='utf8')
        cursor = db.cursor()
        # 使用 execute()  方法执行 SQL 查询
        sql1="truncate table rec;"
        cursor.execute(sql1)
        db.commit()
        sql = "insert into rec(user_id,scenic_id,rating ) values (%s,%s,%s)"

        for i, user, in enumerate(self.dataSet):
            rec_scenics = self.recommend(user)
            print(user,rec_scenics)
            for item in rec_scenics:
                data=(user,item[0],item[1])
                cursor.execute(sql, data)
            db.commit()
            #rec_scenics 是推荐后的数据
            #把user-rec-rating 存到数据库
        cursor.close()
        db.close()



if __name__ == '__main__':
    db = pymysql.connect(host='localhost', user='root', password='123456', database='travel', charset='utf8')
    cursor = db.cursor()
    # 使用 execute()  方法执行 SQL 查询
    sql = "select * from collect"
    cursor.execute(sql)
    cursor.execute(sql)
    data = cursor.fetchall()
    cursor.close()
    db.close()
    with open('rating.csv','w',encoding='utf-8',newline='') as f:
        writer = csv.writer(f)
        writer.writerow(['user_id','scenic_id','rating'])
        for item in data:
            writer.writerow([item[2], item[1],1])
    rating_file = 'rating.csv'
    userCF = UserBasedCF()
    userCF.get_dataset(rating_file)
    userCF.calc_user_sim()
    userCF.evaluate()

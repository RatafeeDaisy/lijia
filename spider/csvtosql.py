import random

import pandas as pd
import pymysql

def run_sql():
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='123456',
        db='travel',
        charset='utf8'
    )

    cursor = connection.cursor()
    df=pd.read_csv('data1.csv',encoding='utf-8')
    print(df.head())
    Road_Type_Str = { '北京':1,'上海':6,'成都':7,'三亚':8,'广州':9,'重庆':10,'深圳':11,'西安':12,'杭州':13,'厦门':14,'武汉':15,
                      '大连':16,'苏州':17,'青岛':18,'天津':3,'南京':19,'香港':20,'桂林':21,'昆明':21}
    df.loc[:, '城市'] = df['城市'].map(Road_Type_Str)

    df['级别'] = df['级别'].str.replace('A景区','')
    df['级别'] = df['级别'].str.replace('无','0')
    print(df)

    for i in range(0,df.shape[0]):
        data=df.iloc[i]
        content = '价格：'+str(data['价格'])+'\n'+'月销量：'+str(data['月销量'])
        data=(data['景区名称'],data['级别'],data['图片'],data['简介'],content,data['地区'],data['城市'])
        print(data)
        sql = "insert into scenic(title,star,logo,introduction,content,address,area_id) values " + str(data) + ";"  #要与表的机构对其。第一个是主键，自增长的。
        try:
            cursor.execute(sql)  #执行sql语句
            connection.commit() #连接提交
        except:
            connection.rollback()

    cursor.close()
    connection.close()
    return

run_sql()

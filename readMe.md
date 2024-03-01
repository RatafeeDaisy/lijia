# 版本
    
    Python3.8
    MySQL必须为8.0版本
# 依赖
    
    pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 启动

    python manage.py runserver
    浏览器输入127.0.0.1:5000
    账号：xiao1@qq.com
    密码：123456

# 其他
    
    flask程序运行过程中查询MySQL数据库，会出现AttributeError: module 'time' has no attribute 'clock' 报错，
    这是因为在 Python 3.8 中，time.clock 被移除了， 取而代之的是 time.perf_counter 或 time.process_time，
    需要修改源代码文件“lib\site-packages\sqlalchemy\util\compat.py”，“lib\site-packages\mako\compat.py"，”lib\site-packages\flask_sqlalchemy\__init__.py"
    中的 time.clock()或time.clock 为 time.perf_counter()或time.perf_counter
    但是修改完毕flask查询数据库时会出现TypeError: 'float' object is not callable
    直接将上述文件中的检测windows程序的代码注释掉只留下 time_func = time.time 即可解决问题

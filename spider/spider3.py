import csv
import random
import time

import requests
from bs4 import BeautifulSoup as bs

def spider(url):
    headers= {
        'user-agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',
        'accept':'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
        'cookie':'SECKEY_ABVK=jjxMoM+3SdmSpIPWb+1xELDhwjCeZp1l67uz6eLx5Mw%3D; BMAP_SECKEY=KC_3WAop1ZLhSjG9n8tWeGYAEq8BNXOAIYr6EPfdHJMgAs6oKygeoXKkllFYFw9qz1rPdS5itQF1OJDiKKfLc5_4QflR4frekawLidkgvkCg9kWulqWUjluwXqVXE4eim6prJhaenEQJS54PmfUeFScqxLwTBlyoMg1Ag5vRVwClxjbQ3UXC_DR-E2Q6boa2; QN1=0000a380306c49219cb8db38; QN300=s%3Dbaidu; QN99=1217; QunarGlobal=10.68.64.14_-6f12bbb6_184643ae759_-212|1668132247406; _i=DFiEuMwwqowl4Juwthg25FTr3nvw; QN269=202BB581616511ED97CBFA163E9C4675; QN601=6c7847b4ff7051e7e917855fc181f5c4; fid=a07b3975-4c18-4daf-82e2-4d466e4bac95; QN48=7ca618cc-f8b0-4eb6-8638-1fdbe1070987; HN1=v17fc58191d459a2f68ed4e71acae61c8f; HN2=qunnuullncqcq; ctt_june=1654604625968##iK3wVK3NWwPwawPwa%3DasaKtOEKXsWsGIasERVP3nEKWDWKXwWsTTast8EKDNiK3siK3saKjOVRDsaS3OWS3nWwPwaUvt; ctf_june=1654604625968##iK3waKg%3DWUPwawPwasGDW2DNXKt%2BVP3NXsohW%3DjNW2amaR0GEREIVDGhaS3siK3siK3saKjOVRDsaS3OWSaOaUPwaUvt; cs_june=84f7873438b355cb820391146f7f028eb66d9aa57ec55e207f5deae15a20687d433762438745017a3ba53630aa32f769657a600d4936f661b047aa28f97814d3b17c80df7eee7c02a9c1a6a5b97c1179cc972c2693553b38ef316168be3128bf5a737ae180251ef5be23400b098dd8ca; ariaDefaultTheme=null; QN57=16681323100710.7563085339991804; QN63=%E6%A1%82%E6%9E%97; qunar-assist={%22version%22:%2220211215173359.925%22%2C%22show%22:false%2C%22audio%22:false%2C%22speed%22:%22middle%22%2C%22zomm%22:1%2C%22cursor%22:false%2C%22pointer%22:false%2C%22bigtext%22:false%2C%22overead%22:false%2C%22readscreen%22:false%2C%22theme%22:%22default%22}; QN205=s%3Dbaidu; QN277=s%3Dbaidu; csrfToken=YjwcEdVX3GB5zM7cG2DRX5fEmttkViAt; QN163=0; QN71=MTEyLjAuMTUyLjQ4OuiLj+W3njox; Hm_lvt_15577700f8ecddb1a927813c81166ade=1668132310,1668928183; QN67=4815%2C6675; QN267=1445208379013eb9bb; _vi=MZ8vmdXflfb92nSgKspyNclv3wMSy9dFfeuvod8AYnA-Gt-bjS1ZpJdW75Ry3D_ddm2MdVVdzRyZMWB0-NQhUaMMWa2KiSR0d23Kqplu7ASrs2RvJqt9P_GJTZV1DEFyAdnQRTumhw0TMHpd59_5mWEe6b3sEcrK5IqnOuep1_O1; QN58=1668928182950%7C1668929298267%7C5; Hm_lpvt_15577700f8ecddb1a927813c81166ade=1668929298; JSESSIONID=5C8B96CD7A9E0C462DF6ECC03A780C8A; QN271=62d29832-1149-472e-a4fa-316b863fddbd; __qt=v1%7CVTJGc2RHVmtYMTlqcTNwM0swcG5JV3IxUzZPQnFFV0R5NmhmMWVOVUtPWVJyNGlKK1hSbWlvR0RmTHBpcjZVTWp1cmwzcTM0aXgvelFwcG0xa25lbjZZWXgwMDVkKzZPemdobld3RnBtbitoSlkrK0h5UGJJOXVvWCtHa3k5dTVRWkthSzZmVnNsUFU1TXkva3FpU0lhZkp2dlFHT2tDRkppUkFUTHJxN3BJPQ%3D%3D%7C1668929382270%7CVTJGc2RHVmtYMStlUEJpVVV3b2VvYVZzRWZlZS9IdElmb0xGQjYxMTVpUC95RTgzdi9YK1dUbC9kS3V6S1ZZaktja0pYb1NGSlM0bU9wVEJjeGd0NEE9PQ%3D%3D%7CVTJGc2RHVmtYMS9HSWVSY1kzYjdMcTJVZWgwZnpxZmZSNXcwN0lPQzk0VlUxWkJYVGtYTUUyTGxUd1dxS01uMk1xb0tDS2lpV3NNRXpLdGNIMHNsT0x2Vm1oR2tvbXJrenlSb2hweXRIbnNEdmlVUWpVMEZhSkcybDBkSitTek1xRlFDRXpQVzMxRWwyWFNTTmdnNzhhbWN3WVB5Z0JVODV4aGRhTjJpbXVoRFFpT2puU29zbXUzMzhlTFBublJaRkVwd0piWE1MYUZJdjZ1bVFnVFdoLzUvbGQzTEhGWmsyMmd2N2RXMjllcHpMR1FUbEZpdjdwTEg5K0t0K0JMRG1NZHZ4RjVaaTdFMk9BNlhZVk9sMHNGSXMwSmFCajNhdDYvSmFIVFVmSVNqTTd6V0FJZFUxcWVlRXF2MFhZa1ZweUV6NVJwN0E2TzVkQit1SVREVEJ2czhaelFvTEp6dlIrTkt5UU13OS9OeE0rRllId0JMU29xQnJOZmRtT1ppaHc2eE5WU2d1NWt2b1pRbnVqWXlKeThBcm5SVTlEYTlLNVk0eFhDZ2JyZmxJaER3RUVlVVFlWU0vLzNyWUxCV0NSOG8vSGFjN0hCMHk3TElqUC83SUowZkI5RmRDZTFBYTVtZXRpUFlmeDRNV2JiSWE2c3RUQTB1OEJsVXB0VU9mY3RrbVZZN0JNTDJUanBlYjI1dnJFd2tvdCtBdHRlWHJKb0UvcXBaYnBuY3BPb1RLdk5FSW8wZmFLaDc4VDhsY21sNS8yME5qZGl4b0tET29TaXA2KzhYYk9waG9ybW1qVmIvcTUydjhkeC93eTJ6NDNVWWFhYjg0cUt6emxacE13aCtyMXloeUFIMTAyK1MySXJuZXRET3A2TlZRTEoyNHJtMFdNODMreUc1S1VLcURkNFprU09GN3ZSblZ5bkF6K3gxRVpTc2l5ZXFmOWY3cEdJendmVHNFL0J1TWF4U2VzeVJSdkJmUk9VdGViYkcxc01VN2RkSkQ2VHNFckJ1Vzk1NzVUQm9la1lYWE9leGp5SmdrTGlVSXlOVXpFMDEvRjdjTEFxNDE1YUw4cDd2YUVhaFovVGNCOGNaeThDUg%3D%3D'
    }
    req=requests.get(url,headers=headers)
    req.encoding='utf-8'
    return bs(req.text,'html.parser')
citys=['北京','上海','成都','三亚','广州','重庆','深圳','西安','杭州','厦门','武汉','大连','苏州','青岛','天津','南京','香港','桂林','昆明']
with open('data1.csv', 'w', newline='',encoding='utf-8')as f:
    csv_write = csv.writer(f)
    csv_write.writerow(['景区名称','级别','地区','热度','简介','价格','月销量','城市','图片'])
    for c in citys:
        for i in range(0,31):
            time.sleep(random.randint(5,10))
            url='https://hotel.qunar.com/cn/beijing_city/?fromDate=2023-02-16&toDate=2023-02-17&cityName='.format(c)+c
            pbj=spider(url)
            for i in pbj.find_all('div',class_="sight_item"):
                name = i.find('a',class_='name').text
                img_url = i.find('img',class_='img_opacity load')['data-original']
                try:
                    level = i.find('span',class_='level').text
                except:
                    level = '无'
                area = i.find('span',class_='area').text
                star = i.find('span',class_='product_star_level').text.replace('热度 ','')
                try:
                    jianjie = i.find('div',class_="intro color999").text
                except:
                    jianjie = '无'
                try:
                    price = i.find('span',class_="sight_item_price").text.replace('¥','').replace('\xa0起','')
                except:
                    price = 0
                try:
                    num = i.find('span',class_="hot_num").text
                except:
                    num = 0
                #print([name,level,area,star,jianjie,price,num])
                csv_write.writerow([name,level,area,star,jianjie,price,num,c,img_url])

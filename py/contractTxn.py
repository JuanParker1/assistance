import DataCollect.DataMem
from DataCollect.HuobiDMService import HuobiDM
from pprint import pprint

dataMem = DataCollect.DataMem
dm = HuobiDM("", "", "")
for i in range(3):
    url1 = 'https://api.bscscan.com/api?module=account&action=txlist&address=0x1216Be0c4328E75aE9ADF726141C2254c2Dcc1b6&startblock=0&endblock=99999999&page='
    url2 = '&offset=5&sort=asc&apikey=JRYY4PT6QMHDE5IV3H8VYJX4UM56JAYXHP'
    url = url1+str(i+1)+url2
    #print(url)
    resultJson = dm.get_tmp(url)
    strKey = '0x1216Be0c4328E75aE9ADF726141C2254c2Dcc1b6_'+str(i)
    dataMem.setTmp(strKey, resultJson)
    #pprint (resultJson)
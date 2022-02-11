import DataCollect.DataMem
import time
from DataCollect.HuobiDMService import HuobiDM
from pprint import pprint

dataMem = DataCollect.DataMem
dm = HuobiDM("", "", "")
address = "0x42867df3c1ce62613aae3f4238cbcf3d7630880b"
startblock = 12264024
#startblock = 8488023
times = 999999999
trys = 3
counts = 0
interval = 300000
enddingblock = 15166486
for i in range(times):
    if(startblock > enddingblock):
        exit()
    print("start: "+str(i+1))
    url1 = 'https://api.bscscan.com/api?module=account&action=txlist&address=' + address + '&startblock=' + str(startblock+1)
    endblock = startblock + interval
    url2 = '&endblock=' + str(endblock)
    url3 = '&sort=asc&apikey=JRYY4PT6QMHDE5IV3H8VYJX4UM56JAYXHP'
    url4 = '&page=1'
    url = url1 + url2 + url3 + url4
    print(url)
    resultJson = dm.get_tmp(url)
    if(len(resultJson.get("result"))==10000):
        for j in range(trys):
            print('try trys-------------------')
            url1 = 'https://api.bscscan.com/api?module=account&action=txlist&address=' + address + '&startblock=' + str(startblock + 1)
            endblock = startblock + (int(interval/trys))
            url2 = '&endblock=' + str(endblock)
            url = url1 + url2 + url3 + url4
            print(url)
            resultJson = dm.get_tmp(url)
            strKey = address + '_' + str(counts)
            counts += 1
            startblock = endblock
            dataMem.setTmp(strKey, resultJson)
            print("strKey "+strKey, len(resultJson.get("result")))
            time.sleep(5)
    else:
        strKey = address + '_' + str(counts)
        counts += 1
        startblock = endblock
        dataMem.setTmp(strKey, resultJson)
        print("strKey " + strKey, len(resultJson.get("result")))
        time.sleep(5)

    #pprint (resultJson)
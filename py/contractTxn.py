import DataCollect.DataMem
import time
from DataCollect.HuobiDMService import HuobiDM
from pprint import pprint

dataMem = DataCollect.DataMem
dm = HuobiDM("", "", "")
address = "0x1b6d3e5da9004668e14ca39d1553e9a46fe842b3"
#apikey = "JRYY4PT6QMHDE5IV3H8VYJX4UM56JAYXHP" #BSC MAINNET
#apikey = "Y7J153VGPMHU5VK6X1SF2V6E92QF3PAWVN" #AVAX MAINNET
apikey = "PP4YZQY672JIYIV6BG6H5GWQA5XJ5A3IS1" #AVAX ETH
#mainnet = "https://api.bscscan.com/api"#BSC MAINNET
#mainnet = "https://api.snowtrace.io/api"#AVAX MAINNET
mainnet = "https://api.etherscan.io/api"#ETH MAINNET
startblock = 12638047
#startblock = 8488023
times = 999999999
trys = 3
counts = 0
interval = 300000
enddingblock = 14166808
for i in range(times):
    if(startblock > enddingblock):
        exit()
    print("start: "+str(i+1))
    url1 = mainnet+'?module=account&action=txlist&address=' + address + '&startblock=' + str(startblock+1)
    endblock = startblock + interval
    url2 = '&endblock=' + str(endblock)
    url3 = '&sort=asc&apikey='+apikey
    url4 = '&page=1'
    url = url1 + url2 + url3 + url4
    print(url)
    resultJson = dm.get_tmp(url)
    if(len(resultJson.get("result"))==10000):
        for j in range(trys):
            print('try trys-------------------')
            url1 = mainnet+'?module=account&action=txlist&address=' + address + '&startblock=' + str(startblock + 1)
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
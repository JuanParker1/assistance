import DataCollect.DataMem
import time
from DataCollect.HuobiDMService import HuobiDM
import Configuration

dataMem = DataCollect.DataMem
dm = HuobiDM("", "", "")

scans = Configuration.Configure.scans
scans_config = Configuration.Configure.scans_config
for scan in scans:
    for item in scan.get("items"):
        startblock = item.get("startblock")
        counts = 0
        for i in range(scans_config.get("times")):
            if(startblock > item.get("enddingblock")):
                break
            print("start: "+str(i+1))
            url1 = scan.get("mainnetURL")+'?module=account&action=txlist&address=' + item.get("address") + '&startblock=' + str(startblock+1)
            endblock = startblock + scans_config.get("interval")
            url2 = '&endblock=' + str(endblock)
            url3 = '&sort=asc&apikey='+scan.get("apikey")
            url4 = '&page=1'
            url = url1 + url2 + url3 + url4
            print(url)
            resultJson = dm.get_tmp(url)
            if (len(resultJson.get("result")) == 0):
                print("result is 0 go next")
                startblock = endblock
                continue
            elif(len(resultJson.get("result"))==10000):
                for j in range(scans_config.get("trys")):
                    print('try trys-------------------')
                    url1 = scan.get("mainnetURL")+'?module=account&action=txlist&address=' + item.get("address") + '&startblock=' + str(startblock + 1)
                    endblock = startblock + (int(scans_config.get("interval")/scans_config.get("trys")))
                    url2 = '&endblock=' + str(endblock)
                    url = url1 + url2 + url3 + url4
                    print(url)
                    resultJson = dm.get_tmp(url)
                    strKey = item.get("address") + '_' + str(counts)
                    counts += 1
                    startblock = endblock
                    dataMem.setTmp(strKey, resultJson)
                    print("strKey "+strKey, len(resultJson.get("result")))
                    time.sleep(5)
            else:
                strKey = item.get("address") + '_' + str(counts)
                counts += 1
                startblock = endblock
                dataMem.setTmp(strKey, resultJson)
                print("strKey " + strKey, len(resultJson.get("result")))
                time.sleep(5)

            #pprint (resultJson)
#!/usr/bin/env python3

# -*- coding: utf-8 -*-
import DataCollect.DataMem
import json


dataMem = DataCollect.DataMem
userRequestsKey = 'userRequests'
userRequestsInitKey = 'userRequestsInit'
needRequestsUserRequestsKey = 'needRequestsUserRequests'
mktWebsRequestsKey = 'mktWebsRequests'
restPublicUrlRespsKey = 'restPublicUrlResps'
needRequestsPublicUserRequestsKey = 'needRequestsPublicUserRequests'

def saveRestPublicUrlResps(restPublicUrlResps):
    dataMem.setTmp(restPublicUrlRespsKey, restPublicUrlResps)

def getRestPublicUrlResps():
    return dataMem.getTmp(restPublicUrlRespsKey)

def saveMktWebsRequests(mktWebsRequests):
    dataMem.setTmp(mktWebsRequestsKey, mktWebsRequests)

def getMktWebsRequests():
    mktWebsRequests = dataMem.getTmp(mktWebsRequestsKey)
    return mktWebsRequests

def saveMarketToRedis(data=None,exchNM=None,accKey='',type='',topicIn=None,method='webs',params=None):
    key=""
    dataList=[]
    keyCurr=""
    keyPast=""
    if isinstance(data, str):
        data=json.loads(data)
    if data and exchNM:
        if ('ch' in data) or ('op' in data) or ('table' in data) or ('e' in data) or \
                ('status' in data and data.get('status')=='ok') or ('code' in data and data.get('code')==200) or \
                (method=='rest' and 'okex'==exchNM):
            # if data is the snapshot, drop it and return
            if isinstance(data,dict) and data.get('event') and data.get('event')=='snapshot' and method=='webs':
                return
            # if no data in the object of data, return
            elif isinstance(data,dict) and (not data.get('data')) and (not data.get('tick')) \
                    and (not data.get('e')) and (not data.get('op') and not data.get('op')=='sub') and method=='webs':
                return
            elif isinstance(data,dict) and data.get('data') and method=='webs':
                if 'trades' in data.get('data') and (not data.get('data').get('trades')):
                    return
                if 'orders' in data.get('data') and (not data.get('data').get('orders')):
                    return
            elif isinstance(data,dict) and data.get('ch') and method=='webs':
                if ('accounts.update' in data.get('ch')) or ('orders' in data.get('ch')):
                    if data.get('action')!='push':
                        return
            elif isinstance(data,dict) and method=='rest' and 'order_info' in data and not data.get('order_info'):
                return
            elif 'status' in data and data.get('status')=='fail' and isinstance(data,dict) and method=='rest' and 'okex'==exchNM:
                return
            elif isinstance(data,list) and len(data)<1:
                return

            if 'mkt' in type and method=='rest':
                # exch+acckey+type+topic+params will be uniq
                # turn params list to muti params
                strParams=''
                if params:
                    strParams='|'
                    for para in params:
                        strParams = strParams+'_'+para+':'+str(params.get(para))
                # if the data has real data return. has data means the key ch or topic has value
                if topicIn:
                    keyCurr = exchNM + "|" + accKey + "|" + type +strParams + "|" +topicIn +"|"+method+"|curr"
                    keyPast = exchNM + "|" + accKey + "|" + type +strParams + "|" +topicIn +"|"+method+"|past"
                else:
                    return
            else:
                # if the data has real data return. has data means the key ch or topic has value
                if isinstance(data,dict) and data.get('ch'):
                    keyCurr = exchNM + "|" + accKey + "|" + type + "|" + data.get('ch') + "|"+method+"|curr"
                    keyPast = exchNM + "|" + accKey + "|" + type + "|" + data.get('ch') + "|"+method+"|past"
                elif isinstance(data,dict) and data.get('topic'):
                    keyCurr = exchNM + "|" + accKey + "|" + type + "|" + data.get('topic') + "|"+method+"|curr"
                    keyPast = exchNM + "|" + accKey + "|" + type + "|" + data.get('topic') + "|"+method+"|past"
                elif isinstance(data,dict) and data.get('table'):
                    keyCurr = exchNM + "|" + accKey + "|" + type + "|" + data.get('table') + "|"+method+"|curr"
                    keyPast = exchNM + "|" + accKey + "|" + type + "|" + data.get('table') + "|"+method+"|past"
                elif isinstance(data,dict) and data.get('e'):
                    keyCurr = exchNM + "|" + accKey + "|" + type + "|" + data.get('e') + "|"+method+"|curr"
                    keyPast = exchNM + "|" + accKey + "|" + type + "|" + data.get('e') + "|"+method+"|past"
                elif topicIn:
                    keyCurr = exchNM + "|" + accKey + "|" + type + "|" + topicIn + "|"+method+"|curr"
                    keyPast = exchNM + "|" + accKey + "|" + type + "|" + topicIn + "|"+method+"|past"
                else:
                    return

            # if curr is none then append data to list first, else get the redis buffer first
            if not(dataMem.getTmp(keyCurr)):
                dataList.append(data)
            else:
                dataList=dataMem.getTmp(keyCurr)
                dataList.append(data)
            # store the data to redis curr zone
            dataMem.setTmp(keyCurr, dataList)
            # there are some problems so comment it. not execute
            #Exchange.setCurrPastKey(exch_nm=exchange.name,subIn=data.get('ch'),currKeyIn=keyCurr,pastKeyIn=keyPast)

            # store the data to redis past zone
            if not (dataMem.getTmp(keyPast)):
                # store the account and order info in redis frequently
                if isinstance(data,dict) and (data.get('ch')) and (
                        'account' in data.get('ch') or 'order' in data.get('ch') or 'positions' in data.get('ch')
                ) and (len(dataList) > 0):
                    dataMem.setTmp(keyCurr, '')
                    dataMem.setTmp(keyPast, dataList)
                elif isinstance(data,dict) and (data.get('topic')) and (
                        'account' in data.get('topic') or 'order' in data.get('topic') or 'positions' in data.get('topic')
                ) and (len(dataList) > 0):
                    dataMem.setTmp(keyCurr, '')
                    dataMem.setTmp(keyPast, dataList)
                elif isinstance(data,dict) and (data.get('table')) and (
                        'account' in data.get('table') or 'order' in data.get('table') or 'positions' in data.get('table')
                ) and (len(dataList) > 0):
                    dataMem.setTmp(keyCurr, '')
                    dataMem.setTmp(keyPast, dataList)
                # bina only sub the account and others info that is unfrequently
                elif isinstance(data,dict) and (data.get('e')) and (len(dataList) > 0):
                    dataMem.setTmp(keyCurr, '')
                    dataMem.setTmp(keyPast, dataList)
                elif (topicIn) and (len(dataList) > 0):
                    dataMem.setTmp(keyCurr, '')
                    dataMem.setTmp(keyPast, dataList)
                # store market data less frequent. only market data buffer 100 records, others 10 records buffer
                elif method=='webs' and 'mkt' in type and len(dataList) > 100:
                    dataMem.setTmp(keyCurr, '')
                    dataMem.setTmp(keyPast, dataList)
                elif len(dataList) > 1000:
                    dataMem.setTmp(keyCurr, '')
                    dataMem.setTmp(keyPast, dataList)
    return keyCurr,keyPast

def saveUserRequests(requests=None):
    dataMem.setTmp(userRequestsKey, requests)
    return 'have saved request info to redis'

def saveUserRequestsInitKey(requests=None):
    dataMem.setTmp(userRequestsInitKey, requests)

def getUserRequests():
    reUserRequests=dataMem.getTmp(userRequestsKey)
    return reUserRequests

def getUserRequestsInit():
    reUserRequests=dataMem.getTmp(userRequestsInitKey)
    return reUserRequests

def getPastKeys():
    reKeys = []
    for key in dataMem.getStrKeys():
        if key[-4:] == 'past':
            reKeys.append(key)
    return reKeys

def flushPastKey(key=None):
    dataMem.setTmp(key,'')

def getAcckey(key=''):
    reAcckey=key
    tmpList=reAcckey.split('|')
    reAcckey=tmpList[1]
    return reAcckey

def getExchNM(key=''):
    reExchNM=key
    tmpList=reExchNM.split('|')
    reExchNM=tmpList[0]
    return reExchNM

def getValue(keyIn=''):
    return dataMem.getTmp(keyIn)

def saveNeedRequestsUserRequests(obj=None):
    dataMem.setTmp(needRequestsUserRequestsKey, obj)

def saveNeedRequestsPublicUserRequests(obj=None):
    dataMem.setTmp(needRequestsPublicUserRequestsKey, obj)

def getNeedRequestsPublicUserRequests():
    obj = dataMem.getTmp(needRequestsPublicUserRequestsKey)
    return obj

def getNeedRequestsUserRequests():
    obj=dataMem.getTmp(needRequestsUserRequestsKey)
    return obj

def getNeedRequestsUserRequestsTopics(isPublic=False):
    reList = []
    if isPublic:
        topics = getNeedRequestsPublicUserRequests()
    else:
        topics=getNeedRequestsUserRequests()
    for userRequest in topics:
        for keysRestReq in userRequest.get('keys_rest_reqs'):
            for topic in keysRestReq.get('topics'):
                topic['exch_nm'] = keysRestReq.get('exch_nm')
                topic['acc_key'] = keysRestReq.get('acc_key')
                topic['sec_key'] = keysRestReq.get('sec_key')
                topic['pass'] = keysRestReq.get('pass')
                reList.append(topic)

    return reList

def getInstrumentsPrices(instruments,exchange,prdType):

    """
    :param instruments:
    :param exchange:
    :param prdType:
    :return:
    reDictLst = [{instrument:BTC, price:10000,cost:9800,high:11000,low:9600},]
    """

    reDictLst = []

    return reDictLst

def getKeys(pattern='*'):
    return dataMem.getStrKeys(pattern)

def getValueBykey(key=None):
    return dataMem.getTmp(key)

def getHedgeOrders(key=''):
    hedgeKey = key+'|hedgedOrders'
    return dataMem.getTmp(hedgeKey)
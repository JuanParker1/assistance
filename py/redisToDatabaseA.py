#!/usr/bin/env python3

# -*- coding: utf-8 -*-
"""

"""
import time
import asyncio
import DatabaseMng.orm
from DatabaseMng.models import Kline
import DataCollect.DataMem
from pprint import pprint
import Redis
import Configuration




def start_loop(loop):
    asyncio.set_event_loop(loop)
    loop.run_forever()

# save json to database table mkt_trade
async def kline(_pool, exchangeIn="", tsIn=0):
    dataMem = DataCollect.DataMem
    if exchangeIn == 'gate':
        currency_pairs = Configuration.Configure.pairs
        keyGateKline = "gate_kline"
        exchange = 'gate'
        interval = Configuration.Configure.gatePara.get("interval")
        for currency_pair in currency_pairs:
            keyGate = keyGateKline + currency_pair
            objNeedSave = dataMem.getTmp(keyGate)
            if not objNeedSave:
                continue
            decodejson = objNeedSave
            for record in decodejson:
                print(record)
                _kline = Kline(
                    exchange=exchange,
                    symbol=currency_pair,
                    interval=interval,
                    timestamp=record[0],
                    vol=float(record[1]),
                    close=float(record[2]),
                    high=float(record[3]),
                    low=float(record[4]),
                    open=float(record[5]),
                    ts=tsIn
                )
                await _kline.save(pool=_pool)
    #return keyIn

async def main(loop):
    # get database connect pool
    #_pool = await DatabaseMng.orm.create_pool(loop=loop, user='research', password='123456', db='world')
    pool = await DatabaseMng.orm.create_pool(loop=loop, user=Configuration.Configure.database.get('user'),
                                              prot=Configuration.Configure.database.get('prot'),
                                              host=Configuration.Configure.database.get('host'),
                                              password=Configuration.Configure.database.get('password'),
                                              db=Configuration.Configure.database.get('db'),
                                              )
    now = time.time()
    dataMem = DataCollect.DataMem
    tasks = []
    keyGateKline = "gate_kline"
    exchange = 'gate'
    interval = '15m'
    """
    currency_pairs = Configuration.Configure.pairs
    for currency_pair in currency_pairs:
        keyGate = keyGateKline+currency_pair
        objNeedSave = dataMem.getTmp(keyGate)
        if not objNeedSave:
            return
        coroutine_mktKlineSave = kline(
            decodejson=objNeedSave,
            _pool=pool,
            exchangeIn=exchange,
            tsIn=now,
            symbolIn=currency_pair,
            intervalIn=interval,
            keyIn=keyGate
        )
        tasks.append(coroutine_mktKlineSave)    
    """


    coroutine_mktKlineSave = kline(
        _pool=pool,
        exchangeIn=exchange,
        tsIn=now
    )
    tasks.append(coroutine_mktKlineSave)

    """
  
    """


    if tasks:
        dones, pendings = await asyncio.wait(tasks)

        for task in dones:
            print(task)
            #Redis.flushPastKey(task.result())


while True:
    print('start save redis to database')
    loop = asyncio.get_event_loop()
    loop.run_until_complete(main(loop))
    time.sleep(600)


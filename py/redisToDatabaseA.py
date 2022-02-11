#!/usr/bin/env python3

# -*- coding: utf-8 -*-
"""

"""
import time
import asyncio
import DatabaseMng.orm
from DatabaseMng.models import Kline, Contx
import DataCollect.DataMem
from pprint import pprint
import Redis
import Configuration




def start_loop(loop):
    asyncio.set_event_loop(loop)
    loop.run_forever()

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

async def contx(_pool, address=""):
    dataMem = DataCollect.DataMem
    for i in range(10000):
        keyAddress = address + "_" + str(i)
        objNeedSave = dataMem.getTmp(keyAddress)
        if not objNeedSave:
            continue
        decodejsonLst = objNeedSave.get("result")
        for record in decodejsonLst:
            print(record)
            _contx = Contx(
                blockNumber = record.get("blockNumber"),
                timeStamp = record.get("timeStamp"),
                hash = record.get("hash"),
                nonce = record.get("nonce"),
                blockHash = record.get("blockHash"),
                transactionIndex = record.get("transactionIndex"),
                addrfrom = record.get("from"),
                addrto = record.get("to"),
                value = record.get("value"),
                gas = record.get("gas"),
                gasPrice = record.get("gasPrice"),
                isError = record.get("isError"),
                txreceipt_status = record.get("txreceipt_status"),
                contractAddress = record.get("contractAddress"),
                cumulativeGasUsed = record.get("cumulativeGasUsed"),
                gasUsed = record.get("gasUsed"),
                confirmations = record.get("confirmations"),
                mainnet = record.get("mainnet"),
                address = record.get("address"),
            )
            await _contx.save(pool=_pool)

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
    coroutine_mktKlineSave = kline(
        _pool=pool,
        exchangeIn=exchange,
        tsIn=now
    )
    coroutine_contxSave = contx(
        _pool=pool,
        address="0x1216Be0c4328E75aE9ADF726141C2254c2Dcc1b6"
    )
    tasks.append(coroutine_mktKlineSave)
    tasks.append(coroutine_contxSave)

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


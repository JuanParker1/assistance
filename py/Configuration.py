#!/usr/bin/env python3

# -*- coding: utf-8 -*-

class Configure:
    pairs = [
        "HIVE_USDT", "ETH_USDT", "FLUX_USDT", "QRDO_USDT",
        "VRA_USDT", "TOMO_USDT", "EPS_USDT", "EDEN_USDT",
        "AGLD_USDT", "QUACK_USDT", "CLV_USDT", "SLP_USDT",
        "AUDIO_USDT", "MOVR_USDT", "RENBTC_USDT", "ROSE_USDT",
        "ICX_USDT", "JASMY_USDT", "AUCTION_USDT", "STPT_USDT",
        "MOVR_USDT", "WIN_USDT", "PERP_USDT", "CELR_USDT",
        "XVS_USDT", "NMR_USDT", "METAX_USDT", "EDEN_USDT",
        "XAVA_USDT", "COTI_USDT", "TOKE_USDT", "ANY_USDT",
        "TVK_USDT", "ARPA_USDT", "REP_USDT", "SYS_USDT"
    ]
    gatePara = {
        "interval": "5m",
        "limit": 1000
    }

    database_bak = {
        'user':'research',
        'host':'localhost',
        'prot': 3306,
        'password':'123456',
        'db':'world'
    }
    database = {
        'user':'world1919',
        'prot': 3306,
        'host':'localhost',
        'password':'123456',
        'db':'world1919'
    }
    #former snc_database

    exchKeys_test={
        'huobi':[

        ],
        'bina':[

        ],
        'okex':[
            {
                'access_key': '8de64046-2a74-455e-a71e-9d5a206a4cce',
                'secret_key': '1AF0E31C56B0B58582BDAD61D37D7F6F',
                'passphrase': 'hyquantking'
            },{
                'access_key': '9bbcd30c-c1a7-44e2-be31-479ef8ded1d1',
                'secret_key': '9547DD62A17734898213C9A446130694',
                'passphrase': '11f67a8cbacb45a9bf17f2d442e2d536'
            },

        ],
        'bitget':[

        ]
    }

    exchKeys_cho = {
        'huobi': [
            {'access_key': '444cdaf8-rfhfg2mkl3-8c0fdce0-0c854', 'secret_key': 'efa1c5a7-632e99ea-f8dc3979-2b7ff'},
        ],
        'bina': [
            {'access_key': '8s03Y96nf3h0Z3egkHrHBXQoHOqUOfm44OhOdwPUIJJJMghrkkYxUvHc4MWPGsLV',
             'secret_key': 'sVvMOvntzjzKMpP78P345cSpXlXqTc3tsuYifzMYdvY1xKUil7Px6jjkH6lb4726'},
        ],
        'okex': [
            {
                'access_key': 'c94e1822-9cc2-47a4-9857-6a79d3b870e4',
                'secret_key': 'E0015A72292468B58422152837162F64',
                'passphrase': 'chochoc'
            },

        ],
        'bitget': [{
            'access_key': 'bg_58c50411162edc5febb166b2b7b64877',
            'secret_key': '038e6b2c2b1a2f3835c052502bc8c9ebf2a67777b61c6d27c1651f7e265ad92f',
            'passphrase': 'chochoc1919'
        }]
    }

    exchKeys={
        'huobi':[
            {'access_key': '4b10b29e-a9de4a5d-731c2671-dbye2sf5t7', 'secret_key': 'd527c5ff-d537cf2b-311d8bc7-5b958'},
            {'access_key': '5674d14a-fcfce436-1c20d299-ghjrgrft5g', 'secret_key': '1b80ec90-68abec1b-1462400b-c2097'},
            {'access_key': '92eb9383-e4a11103-8f1f1ee8-frbghq7rnm', 'secret_key': 'b6596f5f-02d68b14-06da6737-55f21'},
            {'access_key': 'a7ea2ef1-46b49843-8ce8608b-3d2xc4v5bu', 'secret_key': '0b6107fd-c75096d4-45efff6b-158c7'},
            {'access_key': 'afwo04df3f-5f2cb2e2-90046f54-01350', 'secret_key': '7d254bd3-eef8a809-ff744b38-88af4'},
            {'access_key': 'dc6e8718-yh4fhmvs5k-e1d597cb-4e65e', 'secret_key': '53936228-f11c3242-a6c5427b-78244'},
            {'access_key': '4023d622-384269d9-nbtycf4rw2-e2759', 'secret_key': 'b1780234-a58e109c-8d38bbef-8df29'},
            {'access_key': '7dd9844c-ez2xc4vb6n-dd254bb9-c9b97', 'secret_key': '371afe3f-aadeeec5-c8b7d1eb-436cd'}, #

        ],
        'bina':[
            {'access_key': 'PKz8Wg6NxQwgGWqua7X9YkBHOQ22p53WkiaddbVDcwJ6weYiIkWLzXxu3bZxcRhG',
             'secret_key': 'SKrytbxDH3Qdrf7MU9unslxol89H5pCVjP1ERVWHcBbho8NbwFlxQCrfqROKvA8a'},
            {'access_key': 'wsM4WguOhafYZ9pV41lNQMjITjhrwYNkcrLSoTTAvZs3ZlC3dLTKZpCG4ebOmUYz',
             'secret_key': '1FoX7vRwMUkKON31I0x2eeHZj4Z0LkgWEqiZYUd5RliKac2l86GqGzjaJ4y6qAah'},
            {'access_key': 'p27t1DxYLDVydxbRmymqOqNyq2mjrdD6NwTut54uqNcscwfgiJfmJb5k3hn8f00g',
             'secret_key': 'dI2rC9J5VTLZHkKlFA2w9BfK0mWmpB5NVnlzCgLbfXOcH3XRSrC1IJFR1LeUBmBe'},
            {'access_key': 'CNRYD17sQfcGRRpTwNvgsQlcMyBNynNv5u8eR7jeDuLd91vQr4oXRSmNXbOSImKI',
             'secret_key': '2Bq3T2fww1aAYtdpqAVzfb3FSpoBmaKmf8Mm0NLLr6wnR4u1mc1IAp4VxuMtUyQC'},
            {'access_key': 'RIIdD0AHeMlpAp6qv47xVjZCwGHDAe8ymnkWj8RiTp9DM8Ql8IizuQIKZOKNT19A',
             'secret_key': 'rQgfF0oVJAGCkQEqx1G11lRKkmWpxb6OjSQ7UY6oNHbXncFrhhIQhrwW66nyGKWB'},
            {'access_key': 'oKSJv8QRZcqQ2PEceIcFBkxINVwhhBTSyPLiMzZPLtTHaZA7HHFvi7kUE35ruOdl',
             'secret_key': 'Mrk3ZRENZv1MxG6JA5AYMmdbwkiuoxbV1DZi76frKaa32kQZ0Pi2veIk9ELxgLOn'},
        ],
        'okex':[
            {
                'access_key': '8de64046-2a74-455e-a71e-9d5a206a4cce',
                'secret_key': '1AF0E31C56B0B58582BDAD61D37D7F6F',
                'passphrase': 'hyquantking'
            }, {
                'access_key': '5b0ac07f-a706-42e6-bd12-eac89fdf4257',
                'secret_key': 'F370DD32460BF90F093EF8D780C99007',
                'passphrase': 'Bvcapital2019'
            }, {
                'access_key': 'e2f36b05-b16e-4f8b-81e8-49063ead6e6b',
                'secret_key': '035E34E49E9B2277A619AB5B840A24BA',
                'passphrase': 'sncrating'
            }, {
                'access_key': '9bbcd30c-c1a7-44e2-be31-479ef8ded1d1',
                'secret_key': '9547DD62A17734898213C9A446130694',
                'passphrase': '11f67a8cbacb45a9bf17f2d442e2d536'
            }, {
                'access_key': '83ae5dee-cec4-48e0-a0c5-ff8dfcc9fba8',  
                'secret_key': '94B087CB4051CC5A145EAEB75C3ADAE7',
                'passphrase': 'komoxobwbzysrf1303'
            }, {
                'access_key': '51bf0f95-7218-4550-b0cb-5bd5e7200d28',
                'secret_key': 'C535B9BE3D0A37FC290099A5AA558738',
                'passphrase': '123456'
            }, {
                'access_key': 'b47d3527-cfa1-4776-b815-caa5d33a3ff7',
                'secret_key': '7B11FE20C5621E02C8EA428FC7B64F00',
                'passphrase': 'Nic661661'
            }, {
                'access_key': '7c85198e-8b06-4fb3-b59b-1d77fc196d38',
                'secret_key': 'C3710691E4672F6973274FEDBB15C745',
                'passphrase': 'bingkuan'
            }, {
                'access_key': 'e68532bd-a41e-40d2-a258-fc5b66a8e42b',
                'secret_key': '0C325246FD5C12029152F732E0C7688F',
                'passphrase': 'guosizheng'
            }, {
                'access_key': '8d9a45df-e59f-4b5a-a318-7a55f1c4fe35',
                'secret_key': '4403F7329A1A7F5F8A781FD0E8F4CA26',
                'passphrase': '123456'
            }, {
                'access_key': 'e3f277fd-159c-499d-a45f-0c3d07f68cb0',
                'secret_key': '08F2C9A22DCB4494A79CBB60F38F18F2',
                'passphrase': 'liunanyaxuan'
            }, {
                'access_key': '1d886f47-46f6-4129-9727-73249153a673',
                'secret_key': 'A3AE6B6B74AD42CC172B609827C369CB',
                'passphrase': '123456'
            }, {
                'access_key': '68a62985-fa88-4bb6-836d-b6dc38ecebbd',
                'secret_key': '24EA2E1265A6487FEFC830DD221691EF',
                'passphrase': 'sncquant'
            }, {
                'access_key': 'a95217fd-ed25-4370-8fb2-ba5f05d60c1a',
                'secret_key': '7440CB5357E01C9CF1B9CF62DEEB34F6',
                'passphrase': 'bz2020'
            }, {
                'access_key': '33d58d05-9fe5-48ce-b9f6-ca20f15650b1',
                'secret_key': 'E3900A4F6DDDAFFD518EA7F2D1FB3E11',
                'passphrase': 'gongshi'
            }, {
                'access_key': '0f926824-a414-4732-abe7-a5beeb254625',
                'secret_key': '92147E8EACCC88A643A650AE9A7EE3CE',
                'passphrase': '26Fighting'
            }, {
                'access_key': 'bc55df2c-a67d-4aa2-a616-2619953b7658',
                'secret_key': 'E15D4FB0E60392A1619E04F1597A4ADC',
                'passphrase': 'komoxobwbzysrf1303'
            }, {
                'access_key': '29a2eea2-e577-46da-a517-631c71c4c6bd',
                'secret_key': '542E3E4F28E009985DB36387A325879C',
                'passphrase': 'Lgy152418'
            }, {
                'access_key': 'c7d54efb-c2c6-404d-81b2-0f5e7f2ce091',
                'secret_key': 'F2A84DF61AE1375B032080EF8762ADDB',
                'passphrase': 'surong1118'
            }, {
                'access_key': '9d37ac9c-3210-4d45-93e6-c660e0bafea5',
                'secret_key': '558BBF0894168AAD632A0CD20B224A0F',
                'passphrase': '5527700'
            },{
                'access_key': 'a55f635a-b352-487a-8656-fbeb57c43b4c',
                'secret_key': 'EAB0CEE2A41EE8D82A0A10EB340DBCBD',
                'passphrase': '231231'
            },{
                'access_key': 'f46b9b4f-5a8d-4594-9271-2efc310194aa',
                'secret_key': '9288C9D6D85481CF50B1D519A07A87C3',
                'passphrase': 'liunanyaxuan'
            },{
                'access_key': '7e642275-d846-4e9a-bd81-e6f0db0d3e62',
                'secret_key': '5C717853AF34CFFCFB6D1B6A065376C3',
                'passphrase': 'Norxaswithsnc01'
            },{
                'access_key': '1ccc3496-2d5f-4410-b438-13f16e0c6c10',
                'secret_key': '9D1A2CBA1F3308A9898108EDBD2609CB',
                'passphrase': 'liunanyaxuan'
            },{
                'access_key': 'fa638375-7b3e-406c-9621-030f3ab3828e',
                'secret_key': '6EA611450DE5E963E865A047F63D12EF',
                'passphrase': 'liunanyaxuan'
            },{
                'access_key': '39b11419-a87d-423a-9737-3712a3c01640',
                'secret_key': '44614DBD08D254E86D3F31EB8751ADBA',
                'passphrase': 'lhy0312and'
            },{
                'access_key': 'bd1e7fa0-8f73-4779-b6b4-27b80967217c',
                'secret_key': '8B259F098554A099C990CB6BA6A30201',
                'passphrase': 'consensus'
            },{
                'access_key': '10792029-ee45-4c27-97d3-b26b5beaa24f',
                'secret_key': 'FD7195ABC53A48E45CC0D50B9B668C09',
                'passphrase': 'coin919'
            },
        ]
    }

    topSymbols = [
        'btc','eth','bch','eos','xrp','bsv','ltc','zec','link','ht','etc','ada','trx','dash','xlm',
        'atom','ont','tt','xtz','cro','neo','seele','em','xmr','act','iost','akro','dac','vet','qtum',
        'dot','iris','theta','btm','luna','nuls','ela','doge','zil','algo','omg','bhd','rsr','ae',
        'hc','btt','kcash','okb','hpt','bnb'
    ]

    topDeliSymbols = [
        'btc','eth'
    ]

    topPerpSymbols =[
        'btc','eth'
    ]

    topOptSymbols = [
        'btc', 'eth'
    ]

    # exclude not top symbol
    def isTop(url='',topic='',symbolIn=None,exchParams=None):
        inTop = False
        symbol=None

        if url == 'https://api.huobi.pro':
            if '/market/history/kline' == topic:
                if isinstance(symbolIn, dict):
                    symbol = symbolIn.get('symbol')
                else:
                    for obj in symbolIn:
                        if obj.get('para') == 'symbol':
                            symbol = obj.get('value')
                if not symbol: return inTop
                quote = symbol[0:-4].lower()
                base = symbol[-4:].lower()
                if quote in Configure.topSymbols and base == 'usdt':
                    inTop = True
                    return inTop
        if exchParams and url=='https://www.okex.com':
            # symbolIn may dict, turn to list
            if isinstance(symbolIn, dict): symbolIn = [symbolIn]
            for exchPara in exchParams:
                if 'topic' in exchPara.get('value'):
                    if '/api/spot/v3/instruments'==exchPara.get('value').get('topic'):
                        for symbol in symbolIn:
                            if exchPara.get('para') == symbol.get('para'):
                                quote = symbol.get('value').split('-')[0].lower()
                                base = symbol.get('value').split('-')[1].lower()
                                if quote in Configure.topSymbols and base == 'usdt':
                                    inTop = True
                                    return inTop
                    elif '/api/account/v3/currencies'==exchPara.get('value').get('topic'):
                        for symbol in symbolIn:
                            if exchPara.get('para') == symbol.get('para'):
                                quote = symbol.get('value').lower()
                                if quote in Configure.topSymbols:
                                    inTop = True
                                    return inTop
                    elif '/api/futures/v3/instruments'==exchPara.get('value').get('topic'):
                        for symbol in symbolIn:
                            if exchPara.get('para') == symbol.get('para'):
                                quote = symbol.get('value').split('-')[0].lower()
                                if quote in Configure.topDeliSymbols:
                                    inTop = True
                                    return inTop
                    elif '/api/swap/v3/instruments'==exchPara.get('value').get('topic'):
                        for symbol in symbolIn:
                            if exchPara.get('para') == symbol.get('para'):
                                quote = symbol.get('value').split('-')[0].lower()
                                base = symbol.get('value').split('-')[1].lower()
                                if quote in Configure.topPerpSymbols and (base=='usdt' or base=='usd'):
                                    inTop = True
                                    return inTop
                    elif '/api/option/v3/underlying'==exchPara.get('value').get('topic'):
                        for symbol in symbolIn:
                            if exchPara.get('para') == symbol.get('para'):
                                quote = symbol.get('value').split('-')[0].lower()
                                base = symbol.get('value').split('-')[1].lower()
                                if quote in Configure.topOptSymbols and (base=='usdt' or base=='usd'):
                                    inTop = True
                                    return inTop
        elif exchParams and url=='https://api.huobi.pro' or url=='https://api.hbdm.com':
            # symbolIn may dict, turn to list
            if isinstance(symbolIn, dict): symbolIn = [symbolIn]

            for exchPara in exchParams:
                if 'topic' in exchPara.get('value'):
                    if '/v1/common/symbols'==exchPara.get('value').get('topic'):
                        for symbol in symbolIn:
                            if exchPara.get('para') == symbol.get('para'):
                                quote = symbol.get('value')[0:-4].lower()
                                base = symbol.get('value')[-4:].lower()
                                if quote in Configure.topSymbols and base == 'usdt':
                                    inTop = True
                                    return inTop
                    elif '/api/v1/contract_contract_info'==exchPara.get('value').get('topic'):
                        for symbol in symbolIn:
                            if exchPara.get('para') == symbol.get('para'):
                                quote = symbol.get('value').lower()
                                if quote in Configure.topDeliSymbols:
                                    inTop = True
                                    return inTop
                    elif '/swap-api/v1/swap_contract_info'==exchPara.get('value').get('topic'):
                        for symbol in symbolIn:
                            if exchPara.get('para') == symbol.get('para'):
                                quote = symbol.get('value').split('-')[0].lower()
                                base = symbol.get('value').split('-')[1].lower()
                                if quote in Configure.topPerpSymbols and (base == 'usdt' or base == 'usd'):
                                    inTop = True
                                    return inTop
        return inTop

    def arrSplit(arr, size):
        s = []
        for i in range(0, int(len(arr)) + 1, size):
            c = arr[i:i + size]
            if c:
                s.append(c)
        return s

    isForceBuildRequests = False
    isForceRequest = True
#print(Configure.database.get('user'))




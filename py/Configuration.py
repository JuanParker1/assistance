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
        'user':'wold1919',
        'prot': 3306,
        'host':'localhost',
        'password':'123456',
        'db':'wold1919'
    }
    #former snc_database

    scans_config ={
        "times": 9999999,
        "trys": 20,
        "interval": 300000
    }

    scans = [
        {
            "mainnetURL": "https://api.etherscan.io/api",
             "apikey": "PP4YZQY672JIYIV6BG6H5GWQA5XJ5A3IS1",
             "project": "CRV",
             "mainnet": "ETH",
             "items":[{
                 "address": "0xF403C135812408BFbE8713b5A23a04b3D48AAE31",
                 "startblock": 12450990,
                 "enddingblock": 14222747
                },{
                 "address": "0x4e3FBD56CD56c3e72c1403e103b45Db9da5B9D2B",
                 "startblock": 12450980,
                 "enddingblock": 14222819
                },{
                 "address": "0x62B9c7356A2Dc64a1969e19C23e4f579F9810Aa7",
                 "startblock": 12451010,
                 "enddingblock": 14222579
                },{
                 "address": "0x8014595F2AB54cD7c604B00E9fb932176fDc86Ae",
                 "startblock": 12451010,
                 "enddingblock": 14222559
                },{
                 "address": "0xCF50b810E57Ac33B91dCF525C6ddd9881B139332",
                 "startblock": 12451030,
                 "enddingblock": 14222779
                },{
                 "address": "0x3Fe65692bfCD0e6CF84cB1E7d24108E434A7587e",
                 "startblock": 12451030,
                 "enddingblock": 14222679
                },{
                 "address": "0x2E088A0A19dda628B4304301d1EA70b114e4AcCd",
                 "startblock": 12451280,
                 "enddingblock": 14214679
                },{
                 "address": "0x05767d9EF41dC40689678fFca0608878fb3dE906",
                 "startblock": 12451860,
                 "enddingblock": 14208889
                },{
                 "address": "0x33F6DDAEa2a8a54062E021873bCaEE006CdF4007",
                 "startblock": 12452130,
                 "enddingblock": 14145259
                },{
                 "address": "0xD18140b4B819b895A3dba5442F959fA44994AF50",
                 "startblock": 13153660,
                 "enddingblock": 14222859
                }
             ]
        }
    ]

    scans_CRV = [
        {
            "mainnetURL": "https://api.etherscan.io/api",
            "apikey": "PP4YZQY672JIYIV6BG6H5GWQA5XJ5A3IS1",
            "project": "CRV",
            "mainnet": "ETH",
            "items": [{
                "address": "0xbEbc44782C7dB0a1A60Cb6fe97d0b483032FF1C7",
                "startblock": 10809470,
                "enddingblock": 14220759
            }, {
                "address": "0x6c3F90f043a72FA612cbac8115EE7e52BDe6E490",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xFd2a8fA60Abd58Efe3EeE34dd494cD491dC14900",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xDeBF20617708857ebe4F679508E7b7863a8A8EeE",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xA96A65c051bF88B4095Ee1f2451C2A9d43F53Ae2",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xaA17A236F2bAdc98DDc0Cf999AbB47D47Fc0A6Cf",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x79a8C46DeA5aDa233ABaFFD40F3A0A2B1e5A4F27",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xb6c057591E073249F2D9D88Ba59a46CFC9B59EdB",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x3B3Ac5386837Dc563660FB6a0937DFAa5924333B",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xA2B47E3D5c44877cca798226B7B8118F9BFb7A56",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xeB21209ae4C2c9FF2a86ACA31E123764A3B6Bc06",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x845838DF265Dcd2c412A1Dc9e959c7d08537f8a2",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x0Ce6a5fF5217e38315f87032CF90686C96627CAA",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x194eBd173F6cDacE046C53eACcE9B953F28411d1",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x4CA9b3063Ec5866A4B82E437059D2C43d1be596F",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x071c661B4DeefB59E2a3DdB20Db036821eeE8F4b",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xC45b2EEe6e09cA176Ca3bB5f7eEe7C47bF93c756",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x410e3E86ef427e30B9235497143881f717d93c2A",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x1de7f0866e2c4adAC7b457c58Cc25c8688CDa1f2",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xE7a24EF0C5e95Ffb0f6684b813A78F2a3AD7D171",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x6D65b498cb23deAba52db31c93Da9BFFb340FB8F",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xd5BCf53e2C81e1991570f33Fa881c49EEa570C8D",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xd81dA8D904b52208541Bade1bD6595D8a251F8dd",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x2fE94ea3d5d4a175184081439753DE15AeF9d614",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x11F419AdAbbFF8d595E7d5b223eee3863Bb3902C",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x7F55DDe206dbAD629C080068923b36fe9D6bDBeF",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xDE5331AC4B3630f94853Ff322B66407e0D6331E8",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xBE175115BF33E12348ff77CcfEE4726866A0Fbd5",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xC18cC39da8b11dA8c3541C598eE022258F9744da",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xB0a0716841F2Fc03fbA72A891B8Bb13584F52F2d",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x890f4e345B1dAED0367A877a1612f86A1f86985f",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x94e131324b6054c0D789b190b2dAC504e4361b53",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xbFcF63294aD7105dEa65aA58F8AE5BE2D9d0952A",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xd662908ADA2Ea1916B3318327A97eB18aD588b5d",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x9582C4ADACB3BCE56Fea3e590F05c3ca2fb9C477",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x6d10ed2cF043E6fcf51A0e7b4C2Af3Fa06695707",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xdFc7AdFa664b08767b735dE28f9E84cd30492aeE",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x69Fb7c45726cfE2baDeE8317005d3F94bE838840",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x7ca5b0a2910B33e9759DC7dDB0413949071D7575",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xAEA6c312f4b3E04D752946d329693F7293bC2e6D",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x90Bb609649E0451E5aD952683D64BD2d1f245840",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x72e158d38dbd50a483501c24f792bdaaa3e7d55c",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xC5cfaDA84E902aD92DD40194f0883ad49639b023",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xD533a949740bb3306d119CC777fa900bA034cd52",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xA464e6DCda8AC41e03616F95f4BC98a13b8922Dc",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x2F50D538606Fa9EDD2B11E2446BEb18C9D5846bB",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xd061D61a4d941c39E5453435B6345Dc261C2fcE0",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x5f3b5DfEb7B28CDbD7FAba78963EE202a494e2A2",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x575ccd8e2d300e2377b43478339e364000318e2c",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x4c18E409Dc8619bFb6a1cB56D114C3f592E0aE79",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x519AFB566c05E00cfB9af73496D00217A630e4D5",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0xeCb456EA5365865EbAb8a2661B0c503410e9B347",
                "startblock": 10809460,
                "enddingblock": 14219519
            }, {
                "address": "0x3687367CcAEBBE89f1bc8Eae7592b4Eed44Ac0Bd",
                "startblock": 10809460,
                "enddingblock": 14219519
            },{
                 "address": "0xE478de485ad2fe566d49342Cbd03E49ed7DB3356",
                 "startblock": 10649300,
                 "enddingblock": 14221569
                },{
                 "address": "0xBCfF8B0b9419b9A88c44546519b1e909cF330399",
                 "startblock": 10649720,
                 "enddingblock": 14221569
                }
            ]
        }
    ]

    scans_bak = [
        {
            "mainnetURL": "https://api.etherscan.io/api",
             "apikey": "PP4YZQY672JIYIV6BG6H5GWQA5XJ5A3IS1",
             "project": "OHM",
             "mainnet": "ETH",
             "items":[{
                 "address": "0xc8c436271f9a6f10a5b80c8b8ed7d0e8f37a612d",
                 "startblock": 14080589,
                 "enddingblock": 14180589
                },{
                 "address": "0xc02392336420bb54ce2da8a8aa4b118f2dceeb04",
                 "startblock": 13027920,
                 "enddingblock": 14190829
                }
             ]
        },{
            "mainnetURL": "https://api.bscscan.com/api",#BSC MAINNET
            "apikey": "JRYY4PT6QMHDE5IV3H8VYJX4UM56JAYXHP" ,#BSC MAINNET
            "project": "",
            "mainnet": "BSC",
            "items": [{
                "address": "0x1216be0c4328e75ae9adf726141c2254c2dcc1b6",
                "startblock": 8488020,
                "enddingblock": 15190289
                },
                {
                "address": "0xb13a07c57ba5297506c71e9c958210fea8bbcef0",
                "startblock": 12264650,
                "enddingblock": 15189619
                }
            ]
        },{
            "mainnetURL": "https://api.snowtrace.io/api",#AVAX MAINNET
            "apikey": "Y7J153VGPMHU5VK6X1SF2V6E92QF3PAWVN", #AVAX MAINNET
            "project": "",
            "mainnet": "AVAX",
            "items": [
                {"address": "0x771ad65bf2837c89a1cc0a0fc601d9de7f217b52",
                 "startblock": 6725070,
                 "enddingblock": 10821139
                 }
            ]
        }
    ]

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




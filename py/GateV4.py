from __future__ import print_function
import gate_api
from gate_api.rest import ApiException
import DataCollect.DataMem
import Configuration

dataMem = DataCollect.DataMem
configuration = gate_api.Configuration()
configuration.key = 'e668de97ebde150207d3d7ba71862833'
configuration.secret = '5ad45eddb0365bbc8ac7489adbd79e8c4fd84209f23bc216060e45f1969e01ab'

# create an instance of the API class
api_instance = gate_api.SpotApi(gate_api.ApiClient(configuration))
currency_pairs = Configuration.Configure.pairs
#currency_pair = 'HIVE_USDT' # str | Currency pair
status = 'open' # str | List orders based on status  `open` - order is waiting to be filled `finished` - order has been filled or cancelled

to0501 = 1619798400
to0502 = 1619884800
to0505 = 1620144000
to0506 = 1620230400
to0509 = 1620489600
to0511 = 1620662400
to0514 = 1620921600
to0517 = 1621180800
to0518 = 1621267200
to051900 = 1621353600
to051912 = 1621396800
to052000 = 1621440000
to0521 = 1621526400
to0523 = 1621699200
to0524 = 1621785600
to0526 = 1621958400
to0527 = 1622044800
to0528 = 1622131200
to0530 = 1622304000
to0531 = 1622390400
to0601 = 1622476800
to0605 = 1622822400
to0608 = 1623081600
to0611 = 1623340800
to0614 = 1623600000
to0616 = 1623772800
to0618 = 1623945600
to0619 = 1624032000
to0621 = 1624204800
to0624 = 1624464000
to0627 = 1624723200
to0630 = 1624982400
t01001 = 1633017600
to1005 = 1633363200
to1007 = 1633536000
to1008 = 1633622400
to1010 = 1633795200
to1014 = 1634140800
to1017 = 1634400000
to1020 = 1634659200
to1021 = 1634745600
to1024 = 1635004800
to1027 = 1635264000
to1030 = 1635523200
fromIn = to1027
toIn = to1030
limit = Configuration.Configure.gatePara.get("limit")
_interval = Configuration.Configure.gatePara.get("interval")

try:
    # Retrieve ticker information
    for currency_pair in currency_pairs:
        api_response = api_instance.list_candlesticks(currency_pair=currency_pair,interval=_interval, limit=limit, _from=fromIn, to=toIn)
        dataMem.setTmp("gate_kline"+currency_pair, api_response)
        for list in api_response:
            print(currency_pair+",", list)
except ApiException as e:
    print("Exception when calling SpotApi->list_tickers: %s\n" % e)

"""
try:
    # List futures orders
    api_response = api_instance.list_orders(currency_pair, status, page=page, limit=limit)
    print(api_response)
except ApiException as e:
    print("Exception when calling SpotApi->list_orders: %s\n" % e)


api_instance = gate_api.SpotApi()
currency_pair = 'BTC_USDT' # str | Currency pair (optional)

try:
    # Retrieve ticker information
    api_response = api_instance.list_tickers(currency_pair=currency_pair)
    print(api_response)
except ApiException as e:
    print("Exception when calling SpotApi->list_tickers: %s\n" % e)

# create an instance of the API class
api_instance = gate_api.SpotApi(gate_api.ApiClient(configuration))
currency = 'TRX' # str | Retrieved specified currency related data (optional)

try:
    # List spot accounts
    api_response = api_instance.list_spot_accounts(currency=currency)
    print(api_response)
except ApiException as e:
    print("Exception when calling SpotApi->list_spot_accounts: %s\n" % e)

# create an instance of the API class
api_instance = gate_api.SpotApi(gate_api.ApiClient(configuration))
order_id = '3562384969' # str | ID returned on order successfully being created
currency_pair = 'BTC_USDT' # str | Currency pair

try:
    # Cancel a single order
    api_response = api_instance.cancel_order(order_id, currency_pair)
    print(api_response)
except ApiException as e:
    print("Exception when calling SpotApi->cancel_order: %s\n" % e)
"""


"""
# create an instance of the API class
api_instance = gate_api.SpotApi(gate_api.ApiClient(configuration))
order = gate_api.Order(currency_pair='BTC_USDT',type='limit',account='spot',side='buy',amount='0.1',price='4000') # Order |

try:
    # Create an order
    api_response = api_instance.create_order(order)
    print(api_response)
except ApiException as e:
    print("Exception when calling SpotApi->create_order: %s\n" % e)
    
"""
"""
# create an instance of the API class
api_instance = gate_api.SpotApi(gate_api.ApiClient(configuration))
currency_pair = 'BTC_USDT' # str | Currency pair
status = 'open' # str | List orders based on status  `open` - order is waiting to be filled `finished` - order has been filled or cancelled
page = 1 # int | Page number (optional) (default to 1)
limit = 100 # int | Maximum number of record returned in one list (optional) (default to 100)

try:
    # List futures orders
    api_response = api_instance.list_orders(currency_pair, status, page=page, limit=limit)
    print(api_response)
except ApiException as e:
    print("Exception when calling SpotApi->list_orders: %s\n" % e)
"""
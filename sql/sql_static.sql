SELECT count(*), kl.symbol FROM kline kl WHERE kl.`interval`='5m' GROUP BY kl.symbol
SELECT count(*) from kline
#down 30% in 15m
SELECT viewkl.pair from (
	SELECT count(*) countnum, kl.symbol pair from kline kl 
	WHERE 1=1
	and kl.high/kl.low>1.2
	and kl.`open` > kl.`close`
	and kl.`interval`='15m'
	GROUP BY kl.symbol
) viewkl

SELECT from_unixtime(kl.`timestamp`) timeCon, kl.`timestamp`, kl.symbol from kline kl where 1=1
and kl.symbol='TOKE_USDT'
and kl.`open` > kl.`close`
and kl.high/kl.low>1.2
and kl.`interval`='15m'
#GROUP BY kl.symbol
ORDER BY timeCon desc

#count amount of Duplicate data
	SELECT count(*) from 
	(
		SELECT max(kl.id) id, kl.`timestamp`, kl.symbol, kl.`interval` from kline kl
		GROUP BY kl.`timestamp`, kl.symbol, kl.`interval`
		HAVING count(1)>1
	) ta 

#del Duplicate data
DELETE from kline kl where kl.id in(
	SELECT ta.id id from 
	(
		SELECT max(kl.id) id, kl.`timestamp`, kl.symbol, kl.`interval` from kline kl
		GROUP BY kl.`timestamp`, kl.symbol, kl.`interval`
		HAVING count(1)>1
	) ta 
)

#count records of a contract
SELECT count(*) from con_tx ct where ct.address='0x57c8041c6aa3440843b5e48b16016a95f822195f'

#max and min timestamp of a contract
SELECT min(ct.timeStamp),max(ct.timeStamp), max(ct.timeStamp)-min(ct.timeStamp) as diff, (max(ct.timeStamp)-min(ct.timeStamp))/3600/24 as days  
from con_tx ct where address = '0x771ad65bf2837c89a1cc0a0fc601d9de7f217b52'

#per day activitys of a contract in the lastest week 
SELECT count(*) total, count(*)/7 from con_tx ct where address = '0x771ad65bf2837c89a1cc0a0fc601d9de7f217b52' 
and (ct.TIMESTAMP < 1644573061-86400*7*1 and ct.TIMESTAMP>(1644573061-86400*7*2)) 


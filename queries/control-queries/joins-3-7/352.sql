select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 25 and ss.ss_hash <= 358 and cd.cd_hash >= 27 and cd.cd_hash <= 777 and i.i_hash >= 538 and i.i_hash <= 938
;

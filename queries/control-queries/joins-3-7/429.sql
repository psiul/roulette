select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 42 and ss.ss_hash <= 792 and cd.cd_hash >= 418 and cd.cd_hash <= 751 and i.i_hash >= 377 and i.i_hash <= 777
;

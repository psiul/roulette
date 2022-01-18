select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 44 and ss.ss_hash <= 444 and i.i_hash >= 78 and i.i_hash <= 411 and cd.cd_hash >= 28 and cd.cd_hash <= 778
;

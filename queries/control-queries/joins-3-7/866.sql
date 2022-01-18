select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 488 and ss.ss_hash <= 821 and i.i_hash >= 19 and i.i_hash <= 419 and cd.cd_hash >= 33 and cd.cd_hash <= 783
;

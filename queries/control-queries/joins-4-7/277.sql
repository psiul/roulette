select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 224 and cd.cd_hash <= 624 and i.i_hash >= 27 and i.i_hash <= 777 and c.c_hash >= 410 and c.c_hash <= 743
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 219 and ss.ss_hash <= 969 and cd.cd_hash >= 390 and cd.cd_hash <= 723 and c.c_hash >= 18 and c.c_hash <= 418
;

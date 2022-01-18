select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 405 and ss.ss_hash <= 805 and cd.cd_hash >= 5 and cd.cd_hash <= 755 and i.i_hash >= 14 and i.i_hash <= 347
;

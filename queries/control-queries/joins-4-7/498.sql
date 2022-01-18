select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 341 and ss.ss_hash <= 674 and cd.cd_hash >= 14 and cd.cd_hash <= 414 and c.c_hash >= 230 and c.c_hash <= 980
;

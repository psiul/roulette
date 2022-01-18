select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 379 and ss.ss_hash <= 712 and c.c_hash >= 505 and c.c_hash <= 905 and cd.cd_hash >= 249 and cd.cd_hash <= 999
;

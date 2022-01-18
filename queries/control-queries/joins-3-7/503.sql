select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 248 and ss.ss_hash <= 581 and cd.cd_hash >= 69 and cd.cd_hash <= 469 and c.c_hash >= 97 and c.c_hash <= 847
;

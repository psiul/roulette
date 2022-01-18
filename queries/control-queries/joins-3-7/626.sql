select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 234 and ss.ss_hash <= 984 and c.c_hash >= 80 and c.c_hash <= 413 and cd.cd_hash >= 598 and cd.cd_hash <= 998
;

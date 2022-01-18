select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 128 and ss.ss_hash <= 878 and cd.cd_hash >= 477 and cd.cd_hash <= 810 and c.c_hash >= 35 and c.c_hash <= 435
;

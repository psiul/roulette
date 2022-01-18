select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 546 and ss.ss_hash <= 946 and cd.cd_hash >= 363 and cd.cd_hash <= 696 and c.c_hash >= 84 and c.c_hash <= 834
;

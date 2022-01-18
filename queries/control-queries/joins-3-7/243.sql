select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 147 and ss.ss_hash <= 897 and cd.cd_hash >= 375 and cd.cd_hash <= 708 and c.c_hash >= 382 and c.c_hash <= 782
;

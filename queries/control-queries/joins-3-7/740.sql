select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 644 and ss.ss_hash <= 977 and cd.cd_hash >= 459 and cd.cd_hash <= 859 and c.c_hash >= 2 and c.c_hash <= 752
;

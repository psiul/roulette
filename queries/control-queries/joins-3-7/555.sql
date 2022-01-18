select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 28 and ss.ss_hash <= 778 and cd.cd_hash >= 509 and cd.cd_hash <= 909 and c.c_hash >= 387 and c.c_hash <= 720
;

select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 263 and ss.ss_hash <= 596 and cd.cd_hash >= 42 and cd.cd_hash <= 792 and c.c_hash >= 339 and c.c_hash <= 739
;

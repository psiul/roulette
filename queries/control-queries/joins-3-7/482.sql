select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 36 and ss.ss_hash <= 369 and c.c_hash >= 95 and c.c_hash <= 845 and cd.cd_hash >= 362 and cd.cd_hash <= 762
;

select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 239 and ss.ss_hash <= 989 and cd.cd_hash >= 467 and cd.cd_hash <= 867 and c.c_hash >= 442 and c.c_hash <= 775
;

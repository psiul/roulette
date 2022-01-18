select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 10 and ss.ss_hash <= 760 and cd.cd_hash >= 50 and cd.cd_hash <= 450 and c.c_hash >= 610 and c.c_hash <= 943
;

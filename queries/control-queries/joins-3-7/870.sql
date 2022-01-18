select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 35 and ss.ss_hash <= 368 and c.c_hash >= 30 and c.c_hash <= 430 and cd.cd_hash >= 0 and cd.cd_hash <= 750
;

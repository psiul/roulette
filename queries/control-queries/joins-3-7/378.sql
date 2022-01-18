select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 184 and ss.ss_hash <= 517 and c.c_hash >= 266 and c.c_hash <= 666 and cd.cd_hash >= 37 and cd.cd_hash <= 787
;

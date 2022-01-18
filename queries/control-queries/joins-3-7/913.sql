select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 95 and ss.ss_hash <= 845 and c.c_hash >= 147 and c.c_hash <= 547 and cd.cd_hash >= 404 and cd.cd_hash <= 737
;

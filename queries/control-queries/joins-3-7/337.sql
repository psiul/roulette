select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 179 and ss.ss_hash <= 929 and c.c_hash >= 46 and c.c_hash <= 379 and cd.cd_hash >= 270 and cd.cd_hash <= 670
;

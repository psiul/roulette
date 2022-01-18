select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 11 and ss.ss_hash <= 761 and c.c_hash >= 125 and c.c_hash <= 525 and cd.cd_hash >= 119 and cd.cd_hash <= 452
;

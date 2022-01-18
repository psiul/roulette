select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 53 and ss.ss_hash <= 803 and c.c_hash >= 28 and c.c_hash <= 428 and cd.cd_hash >= 392 and cd.cd_hash <= 725
;

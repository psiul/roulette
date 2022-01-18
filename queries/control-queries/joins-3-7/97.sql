select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 143 and ss.ss_hash <= 476 and c.c_hash >= 194 and c.c_hash <= 944 and cd.cd_hash >= 438 and cd.cd_hash <= 838
;

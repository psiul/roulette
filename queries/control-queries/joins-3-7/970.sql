select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 6 and ss.ss_hash <= 339 and cd.cd_hash >= 58 and cd.cd_hash <= 808 and c.c_hash >= 164 and c.c_hash <= 564
;

select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 94 and ss.ss_hash <= 494 and cd.cd_hash >= 93 and cd.cd_hash <= 426 and c.c_hash >= 228 and c.c_hash <= 978
;

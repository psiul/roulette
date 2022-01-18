select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 161 and ss.ss_hash <= 911 and cd.cd_hash >= 182 and cd.cd_hash <= 582 and c.c_hash >= 207 and c.c_hash <= 540
;

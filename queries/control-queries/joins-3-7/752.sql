select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 274 and ss.ss_hash <= 607 and c.c_hash >= 213 and c.c_hash <= 613 and cd.cd_hash >= 161 and cd.cd_hash <= 911
;

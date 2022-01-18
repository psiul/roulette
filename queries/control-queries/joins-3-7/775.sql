select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 34 and ss.ss_hash <= 434 and cd.cd_hash >= 249 and cd.cd_hash <= 999 and c.c_hash >= 561 and c.c_hash <= 894
;

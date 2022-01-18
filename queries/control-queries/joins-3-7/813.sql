select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 24 and ss.ss_hash <= 774 and cd.cd_hash >= 121 and cd.cd_hash <= 521 and c.c_hash >= 73 and c.c_hash <= 406
;

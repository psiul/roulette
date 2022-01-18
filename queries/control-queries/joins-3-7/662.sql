select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 539 and ss.ss_hash <= 872 and cd.cd_hash >= 151 and cd.cd_hash <= 901 and c.c_hash >= 108 and c.c_hash <= 508
;

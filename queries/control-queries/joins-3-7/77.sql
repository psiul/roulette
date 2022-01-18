select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 118 and ss.ss_hash <= 518 and cd.cd_hash >= 211 and cd.cd_hash <= 544 and c.c_hash >= 23 and c.c_hash <= 773
;

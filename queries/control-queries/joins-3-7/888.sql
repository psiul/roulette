select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 218 and ss.ss_hash <= 968 and cd.cd_hash >= 185 and cd.cd_hash <= 518 and c.c_hash >= 371 and c.c_hash <= 771
;

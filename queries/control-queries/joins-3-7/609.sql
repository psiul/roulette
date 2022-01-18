select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 83 and ss.ss_hash <= 416 and cd.cd_hash >= 231 and cd.cd_hash <= 981 and c.c_hash >= 144 and c.c_hash <= 544
;

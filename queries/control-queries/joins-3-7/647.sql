select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 162 and ss.ss_hash <= 912 and cd.cd_hash >= 313 and cd.cd_hash <= 713 and c.c_hash >= 398 and c.c_hash <= 731
;

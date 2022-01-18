select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 517 and ss.ss_hash <= 917 and cd.cd_hash >= 212 and cd.cd_hash <= 962 and c.c_hash >= 444 and c.c_hash <= 777
;

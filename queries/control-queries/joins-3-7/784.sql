select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 226 and ss.ss_hash <= 976 and cd.cd_hash >= 13 and cd.cd_hash <= 346 and c.c_hash >= 321 and c.c_hash <= 721
;

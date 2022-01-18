select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 361 and ss.ss_hash <= 761 and cd.cd_hash >= 330 and cd.cd_hash <= 663 and c.c_hash >= 189 and c.c_hash <= 939
;

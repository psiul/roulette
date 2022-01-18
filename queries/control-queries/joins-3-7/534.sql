select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 207 and ss.ss_hash <= 957 and c.c_hash >= 105 and c.c_hash <= 438 and cd.cd_hash >= 399 and cd.cd_hash <= 799
;

select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 232 and ss.ss_hash <= 982 and cd.cd_hash >= 511 and cd.cd_hash <= 844 and c.c_hash >= 141 and c.c_hash <= 541
;

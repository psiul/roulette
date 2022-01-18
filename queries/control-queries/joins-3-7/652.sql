select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 364 and ss.ss_hash <= 764 and cd.cd_hash >= 131 and cd.cd_hash <= 881 and c.c_hash >= 529 and c.c_hash <= 862
;

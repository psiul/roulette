select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 555 and ss.ss_hash <= 955 and cd.cd_hash >= 563 and cd.cd_hash <= 896 and c.c_hash >= 19 and c.c_hash <= 769
;

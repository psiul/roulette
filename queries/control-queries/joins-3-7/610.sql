select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 567 and ss.ss_hash <= 900 and cd.cd_hash >= 323 and cd.cd_hash <= 723 and c.c_hash >= 66 and c.c_hash <= 816
;

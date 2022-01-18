select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 416 and ss.ss_hash <= 749 and cd.cd_hash >= 47 and cd.cd_hash <= 797 and c.c_hash >= 256 and c.c_hash <= 656
;

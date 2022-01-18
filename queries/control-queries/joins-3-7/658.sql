select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 108 and ss.ss_hash <= 858 and c.c_hash >= 86 and c.c_hash <= 486 and cd.cd_hash >= 359 and cd.cd_hash <= 692
;

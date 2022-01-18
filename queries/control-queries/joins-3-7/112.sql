select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 174 and ss.ss_hash <= 924 and c.c_hash >= 251 and c.c_hash <= 584 and cd.cd_hash >= 357 and cd.cd_hash <= 757
;

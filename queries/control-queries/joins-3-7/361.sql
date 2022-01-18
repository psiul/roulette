select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 140 and ss.ss_hash <= 890 and cd.cd_hash >= 289 and cd.cd_hash <= 689 and c.c_hash >= 590 and c.c_hash <= 923
;

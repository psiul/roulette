select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 355 and ss.ss_hash <= 755 and cd.cd_hash >= 466 and cd.cd_hash <= 799 and c.c_hash >= 240 and c.c_hash <= 990
;

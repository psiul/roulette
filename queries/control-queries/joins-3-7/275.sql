select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 455 and ss.ss_hash <= 855 and c.c_hash >= 220 and c.c_hash <= 553 and cd.cd_hash >= 218 and cd.cd_hash <= 968
;

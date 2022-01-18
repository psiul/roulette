select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 336 and ss.ss_hash <= 736 and c.c_hash >= 76 and c.c_hash <= 826 and cd.cd_hash >= 145 and cd.cd_hash <= 478
;

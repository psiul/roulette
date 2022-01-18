select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 180 and ss.ss_hash <= 930 and c.c_hash >= 268 and c.c_hash <= 601 and cd.cd_hash >= 70 and cd.cd_hash <= 470
;

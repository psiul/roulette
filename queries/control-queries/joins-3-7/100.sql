select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 155 and ss.ss_hash <= 905 and c.c_hash >= 5 and c.c_hash <= 405 and cd.cd_hash >= 319 and cd.cd_hash <= 652
;

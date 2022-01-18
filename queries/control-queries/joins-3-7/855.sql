select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 434 and ss.ss_hash <= 767 and c.c_hash >= 468 and c.c_hash <= 868 and cd.cd_hash >= 15 and cd.cd_hash <= 765
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 91 and ss.ss_hash <= 424 and c.c_hash >= 427 and c.c_hash <= 827 and cd.cd_hash >= 2 and cd.cd_hash <= 752
;

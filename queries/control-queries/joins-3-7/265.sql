select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 59 and ss.ss_hash <= 809 and c.c_hash >= 527 and c.c_hash <= 860 and cd.cd_hash >= 442 and cd.cd_hash <= 842
;

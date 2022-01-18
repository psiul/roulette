select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 85 and ss.ss_hash <= 835 and c.c_hash >= 340 and c.c_hash <= 673 and cd.cd_hash >= 381 and cd.cd_hash <= 781
;

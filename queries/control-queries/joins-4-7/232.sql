select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 85 and ss.ss_hash <= 835 and cd.cd_hash >= 535 and cd.cd_hash <= 868 and c.c_hash >= 306 and c.c_hash <= 706
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 142 and i.i_hash <= 892 and cd.cd_hash >= 113 and cd.cd_hash <= 446 and c.c_hash >= 419 and c.c_hash <= 819
;

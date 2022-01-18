select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 487 and i.i_hash <= 887 and cd.cd_hash >= 298 and cd.cd_hash <= 631 and c.c_hash >= 218 and c.c_hash <= 968
;

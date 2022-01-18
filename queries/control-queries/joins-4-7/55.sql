select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 6 and c.c_hash <= 406 and i.i_hash >= 55 and i.i_hash <= 388 and cd.cd_hash >= 192 and cd.cd_hash <= 942
;

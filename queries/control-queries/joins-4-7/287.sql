select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 573 and c.c_hash <= 906 and cd.cd_hash >= 152 and cd.cd_hash <= 552 and i.i_hash >= 98 and i.i_hash <= 848
;

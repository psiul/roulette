select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 112 and i.i_hash <= 862 and c.c_hash >= 57 and c.c_hash <= 390 and cd.cd_hash >= 176 and cd.cd_hash <= 576
;

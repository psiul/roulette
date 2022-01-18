select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 553 and ss.ss_hash <= 953 and c.c_hash >= 112 and c.c_hash <= 862 and cd.cd_hash >= 318 and cd.cd_hash <= 651
;
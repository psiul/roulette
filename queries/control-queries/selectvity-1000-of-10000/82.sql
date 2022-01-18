select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 650 and c.c_hash <= 983 and d.d_hash >= 167 and d.d_hash <= 917 and cd.cd_hash >= 27 and cd.cd_hash <= 427
;

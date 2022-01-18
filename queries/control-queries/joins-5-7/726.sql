select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 137 and c.c_hash <= 887 and d.d_hash >= 583 and d.d_hash <= 983 and cd.cd_hash >= 265 and cd.cd_hash <= 598
;

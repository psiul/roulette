select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 43 and ss.ss_hash <= 376 and i.i_hash >= 456 and i.i_hash <= 856 and d.d_hash >= 162 and d.d_hash <= 912
;

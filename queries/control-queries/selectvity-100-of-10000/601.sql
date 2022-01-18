select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 303 and d.d_hash <= 503 and i.i_hash >= 261 and i.i_hash <= 361 and c.c_hash >= 378 and c.c_hash <= 878
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 369 and c.c_hash <= 419 and d.d_hash >= 288 and d.d_hash <= 388 and i.i_hash >= 473 and i.i_hash <= 493
;

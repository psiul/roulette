select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 74 and c.c_hash <= 574 and i.i_hash >= 305 and i.i_hash <= 405 and d.d_hash >= 493 and d.d_hash <= 693
;

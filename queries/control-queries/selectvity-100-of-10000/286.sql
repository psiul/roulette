select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 407 and i.i_hash <= 607 and c.c_hash >= 436 and c.c_hash <= 936 and d.d_hash >= 836 and d.d_hash <= 936
;

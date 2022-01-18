select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 295 and ss.ss_hash <= 628 and i.i_hash >= 532 and i.i_hash <= 932 and c.c_hash >= 211 and c.c_hash <= 961
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 521 and i.i_hash <= 921 and c.c_hash >= 392 and c.c_hash <= 725 and d.d_hash >= 54 and d.d_hash <= 804
;

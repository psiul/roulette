select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 161 and ss.ss_hash <= 911 and i.i_hash >= 179 and i.i_hash <= 512 and d.d_hash >= 482 and d.d_hash <= 882
;

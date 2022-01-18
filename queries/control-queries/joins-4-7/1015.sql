select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 616 and ss.ss_hash <= 949 and c.c_hash >= 6 and c.c_hash <= 756 and d.d_hash >= 299 and d.d_hash <= 699
;

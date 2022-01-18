select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 53 and ss.ss_hash <= 386 and i.i_hash >= 125 and i.i_hash <= 875 and d.d_hash >= 343 and d.d_hash <= 743
;

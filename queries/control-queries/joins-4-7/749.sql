select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 22 and d.d_hash <= 422 and c.c_hash >= 55 and c.c_hash <= 805 and i.i_hash >= 466 and i.i_hash <= 799
;

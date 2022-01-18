select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 80 and ss.ss_hash <= 830 and c.c_hash >= 151 and c.c_hash <= 484 and i.i_hash >= 9 and i.i_hash <= 409
;

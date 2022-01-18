select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 83 and ss.ss_hash <= 416 and i.i_hash >= 227 and i.i_hash <= 627 and c.c_hash >= 65 and c.c_hash <= 815
;

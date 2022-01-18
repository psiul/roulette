select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 198 and ss.ss_hash <= 531 and i.i_hash >= 185 and i.i_hash <= 935 and d.d_hash >= 423 and d.d_hash <= 823
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 125 and ss.ss_hash <= 525 and i.i_hash >= 213 and i.i_hash <= 963 and c.c_hash >= 557 and c.c_hash <= 890
;

select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 302 and ss.ss_hash <= 702 and i.i_hash >= 75 and i.i_hash <= 825 and c.c_hash >= 262 and c.c_hash <= 595
;

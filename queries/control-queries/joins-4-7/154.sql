select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 212 and ss.ss_hash <= 612 and c.c_hash >= 180 and c.c_hash <= 930 and d.d_hash >= 602 and d.d_hash <= 935
;

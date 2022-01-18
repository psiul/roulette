select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 115 and ss.ss_hash <= 865 and i.i_hash >= 297 and i.i_hash <= 630 and c.c_hash >= 524 and c.c_hash <= 924
;

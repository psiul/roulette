select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 86 and ss.ss_hash <= 836 and i.i_hash >= 397 and i.i_hash <= 797 and d.d_hash >= 435 and d.d_hash <= 768
;

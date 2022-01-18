select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 342 and ss.ss_hash <= 742 and d.d_hash >= 20 and d.d_hash <= 770 and i.i_hash >= 633 and i.i_hash <= 966
;

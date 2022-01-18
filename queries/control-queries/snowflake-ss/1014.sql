select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 81 and ss.ss_hash <= 831 and d.d_hash >= 513 and d.d_hash <= 846 and i.i_hash >= 366 and i.i_hash <= 766
;

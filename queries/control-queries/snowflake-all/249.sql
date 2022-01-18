select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 162 and c.c_hash <= 912 and d.d_hash >= 645 and d.d_hash <= 978 and i.i_hash >= 94 and i.i_hash <= 494
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 94 and ss.ss_hash <= 594 and c.c_hash >= 878 and c.c_hash <= 978 and d.d_hash >= 21 and d.d_hash <= 221
;

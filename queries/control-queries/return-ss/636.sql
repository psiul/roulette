select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 341 and d.d_hash <= 741 and c.c_hash >= 35 and c.c_hash <= 785 and hd.hd_hash >= 321 and hd.hd_hash <= 654
;

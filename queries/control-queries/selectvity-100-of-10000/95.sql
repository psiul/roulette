select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 694 and ss.ss_hash <= 794 and d.d_hash >= 507 and d.d_hash <= 707 and c.c_hash >= 347 and c.c_hash <= 847
;

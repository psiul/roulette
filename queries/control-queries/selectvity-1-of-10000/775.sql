select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 47 and i.i_hash <= 67 and hd.hd_hash >= 813 and hd.hd_hash <= 913 and c.c_hash >= 397 and c.c_hash <= 447
;

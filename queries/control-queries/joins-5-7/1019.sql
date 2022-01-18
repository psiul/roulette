select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 53 and hd.hd_hash <= 386 and d.d_hash >= 41 and d.d_hash <= 791 and c.c_hash >= 543 and c.c_hash <= 943
;

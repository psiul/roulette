select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 892 and ss.ss_hash <= 992 and c.c_hash >= 653 and c.c_hash <= 703 and d.d_hash >= 340 and d.d_hash <= 360
;
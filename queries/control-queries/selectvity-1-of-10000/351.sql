select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 257 and c.c_hash <= 357 and hd.hd_hash >= 653 and hd.hd_hash <= 703 and d.d_hash >= 548 and d.d_hash <= 568
;

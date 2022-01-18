select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 653 and c.c_hash <= 753 and d.d_hash >= 196 and d.d_hash <= 396 and hd.hd_hash >= 145 and hd.hd_hash <= 195
;

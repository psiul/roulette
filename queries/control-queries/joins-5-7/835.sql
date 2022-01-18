select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 147 and ss.ss_hash <= 547 and c.c_hash >= 238 and c.c_hash <= 988 and hd.hd_hash >= 369 and hd.hd_hash <= 702
;

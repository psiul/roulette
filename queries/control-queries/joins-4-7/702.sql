select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 27 and c.c_hash <= 777 and hd.hd_hash >= 147 and hd.hd_hash <= 547 and d.d_hash >= 319 and d.d_hash <= 652
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 212 and ss.ss_hash <= 962 and d.d_hash >= 189 and d.d_hash <= 522 and hd.hd_hash >= 351 and hd.hd_hash <= 751
;

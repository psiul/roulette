select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 161 and d.d_hash <= 911 and hd.hd_hash >= 579 and hd.hd_hash <= 912 and c.c_hash >= 132 and c.c_hash <= 532
;

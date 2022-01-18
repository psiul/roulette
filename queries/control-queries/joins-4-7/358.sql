select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 3 and ss.ss_hash <= 753 and c.c_hash >= 198 and c.c_hash <= 531 and hd.hd_hash >= 137 and hd.hd_hash <= 537
;

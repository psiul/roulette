select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 108 and d.d_hash <= 508 and c.c_hash >= 59 and c.c_hash <= 809 and hd.hd_hash >= 606 and hd.hd_hash <= 939
;

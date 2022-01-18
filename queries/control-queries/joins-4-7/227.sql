select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 106 and hd.hd_hash <= 856 and d.d_hash >= 392 and d.d_hash <= 725 and c.c_hash >= 159 and c.c_hash <= 559
;

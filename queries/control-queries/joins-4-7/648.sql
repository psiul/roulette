select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 297 and ss.ss_hash <= 697 and hd.hd_hash >= 114 and hd.hd_hash <= 447 and c.c_hash >= 164 and c.c_hash <= 914
;

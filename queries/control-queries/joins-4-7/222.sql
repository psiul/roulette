select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 608 and ss.ss_hash <= 941 and c.c_hash >= 220 and c.c_hash <= 970 and d.d_hash >= 357 and d.d_hash <= 757
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 96 and ss.ss_hash <= 846 and d.d_hash >= 1 and d.d_hash <= 401 and c.c_hash >= 420 and c.c_hash <= 753
;

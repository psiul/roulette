select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 155 and ss.ss_hash <= 488 and c.c_hash >= 16 and c.c_hash <= 416 and d.d_hash >= 155 and d.d_hash <= 905
;

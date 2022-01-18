select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 16 and ss.ss_hash <= 416 and d.d_hash >= 84 and d.d_hash <= 834 and c.c_hash >= 238 and c.c_hash <= 571
;

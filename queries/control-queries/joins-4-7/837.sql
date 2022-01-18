select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 188 and ss.ss_hash <= 938 and hd.hd_hash >= 377 and hd.hd_hash <= 777 and d.d_hash >= 248 and d.d_hash <= 581
;

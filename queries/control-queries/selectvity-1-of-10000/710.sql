select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 503 and ss.ss_hash <= 523 and d.d_hash >= 474 and d.d_hash <= 524 and c.c_hash >= 183 and c.c_hash <= 283
;

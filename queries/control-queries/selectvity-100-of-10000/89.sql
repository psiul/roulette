select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 254 and ss.ss_hash <= 754 and c.c_hash >= 231 and c.c_hash <= 431 and d.d_hash >= 493 and d.d_hash <= 593
;

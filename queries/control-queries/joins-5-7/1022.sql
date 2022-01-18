select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 178 and ss.ss_hash <= 928 and d.d_hash >= 349 and d.d_hash <= 682 and c.c_hash >= 0 and c.c_hash <= 400
;

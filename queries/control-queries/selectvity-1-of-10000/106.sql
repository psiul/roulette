select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 329 and ss.ss_hash <= 349 and i.i_hash >= 657 and i.i_hash <= 757 and d.d_hash >= 259 and d.d_hash <= 309
;

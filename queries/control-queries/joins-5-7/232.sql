select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 305 and ss.ss_hash <= 705 and i.i_hash >= 151 and i.i_hash <= 901 and d.d_hash >= 302 and d.d_hash <= 635
;

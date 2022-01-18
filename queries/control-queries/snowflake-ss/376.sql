select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 73 and d.d_hash <= 473 and i.i_hash >= 53 and i.i_hash <= 803 and hd.hd_hash >= 271 and hd.hd_hash <= 604
;

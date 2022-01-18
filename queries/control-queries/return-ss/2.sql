select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 72 and ss.ss_hash <= 405 and i.i_hash >= 58 and i.i_hash <= 458 and hd.hd_hash >= 18 and hd.hd_hash <= 768
;

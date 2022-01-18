select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 254 and ss.ss_hash <= 587 and d.d_hash >= 181 and d.d_hash <= 581 and hd.hd_hash >= 53 and hd.hd_hash <= 803
;

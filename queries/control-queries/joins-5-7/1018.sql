select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 33 and c.c_hash <= 366 and hd.hd_hash >= 115 and hd.hd_hash <= 515 and i.i_hash >= 207 and i.i_hash <= 957
;

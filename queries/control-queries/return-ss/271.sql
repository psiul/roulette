select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 293 and hd.hd_hash <= 626 and i.i_hash >= 41 and i.i_hash <= 441 and d.d_hash >= 139 and d.d_hash <= 889
;

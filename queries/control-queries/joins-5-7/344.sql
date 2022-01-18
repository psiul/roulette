select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 324 and hd.hd_hash <= 657 and d.d_hash >= 77 and d.d_hash <= 477 and c.c_hash >= 139 and c.c_hash <= 889
;

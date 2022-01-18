select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 223 and i.i_hash <= 623 and c.c_hash >= 223 and c.c_hash <= 973 and hd.hd_hash >= 155 and hd.hd_hash <= 488
;

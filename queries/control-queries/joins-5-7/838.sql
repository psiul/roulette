select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 548 and hd.hd_hash <= 881 and d.d_hash >= 17 and d.d_hash <= 417 and c.c_hash >= 237 and c.c_hash <= 987
;

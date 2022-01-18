select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 154 and d.d_hash <= 904 and c.c_hash >= 131 and c.c_hash <= 531 and i.i_hash >= 388 and i.i_hash <= 721
;

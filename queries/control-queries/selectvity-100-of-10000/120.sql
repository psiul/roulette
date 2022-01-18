select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 339 and c.c_hash <= 439 and i.i_hash >= 101 and i.i_hash <= 601 and hd.hd_hash >= 195 and hd.hd_hash <= 395
;

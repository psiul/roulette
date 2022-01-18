select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 597 and d.d_hash <= 997 and i.i_hash >= 15 and i.i_hash <= 765 and c.c_hash >= 459 and c.c_hash <= 792
;

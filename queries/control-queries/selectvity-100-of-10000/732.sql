select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 230 and i.i_hash <= 730 and d.d_hash >= 546 and d.d_hash <= 646 and c.c_hash >= 115 and c.c_hash <= 315
;

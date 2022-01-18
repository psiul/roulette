select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 635 and hd.hd_hash <= 735 and d.d_hash >= 239 and d.d_hash <= 439 and i.i_hash >= 452 and i.i_hash <= 502
;

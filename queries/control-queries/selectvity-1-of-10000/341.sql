select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 298 and ss.ss_hash <= 348 and i.i_hash >= 173 and i.i_hash <= 273 and d.d_hash >= 540 and d.d_hash <= 560
;

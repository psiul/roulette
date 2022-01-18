select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 412 and d.d_hash <= 462 and i.i_hash >= 193 and i.i_hash <= 393 and hd.hd_hash >= 195 and hd.hd_hash <= 295
;

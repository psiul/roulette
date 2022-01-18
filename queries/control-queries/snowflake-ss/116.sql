select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 127 and c.c_hash <= 877 and d.d_hash >= 136 and d.d_hash <= 536 and i.i_hash >= 288 and i.i_hash <= 621
;

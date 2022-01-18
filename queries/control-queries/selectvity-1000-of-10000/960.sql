select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 332 and ss.ss_hash <= 732 and i.i_hash >= 162 and i.i_hash <= 912 and c.c_hash >= 18 and c.c_hash <= 351
;

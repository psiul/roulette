select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 46 and d.d_hash <= 446 and c.c_hash >= 47 and c.c_hash <= 797 and i.i_hash >= 264 and i.i_hash <= 597
;

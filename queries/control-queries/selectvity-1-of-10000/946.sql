select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 550 and ss.ss_hash <= 570 and i.i_hash >= 654 and i.i_hash <= 704 and hd.hd_hash >= 700 and hd.hd_hash <= 800
;

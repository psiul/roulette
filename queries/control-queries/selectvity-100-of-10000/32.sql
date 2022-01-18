select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 442 and ss.ss_hash <= 942 and i.i_hash >= 620 and i.i_hash <= 720 and hd.hd_hash >= 767 and hd.hd_hash <= 967
;

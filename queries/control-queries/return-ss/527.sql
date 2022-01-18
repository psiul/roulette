select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 211 and ss.ss_hash <= 611 and i.i_hash >= 604 and i.i_hash <= 937 and hd.hd_hash >= 24 and hd.hd_hash <= 774
;

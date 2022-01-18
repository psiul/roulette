select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 505 and c.c_hash <= 838 and hd.hd_hash >= 44 and hd.hd_hash <= 444 and d.d_hash >= 236 and d.d_hash <= 986
;

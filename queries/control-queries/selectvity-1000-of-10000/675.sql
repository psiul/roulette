select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 501 and i.i_hash <= 834 and d.d_hash >= 183 and d.d_hash <= 933 and hd.hd_hash >= 542 and hd.hd_hash <= 942
;

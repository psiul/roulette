select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 385 and d.d_hash <= 718 and i.i_hash >= 48 and i.i_hash <= 798 and hd.hd_hash >= 99 and hd.hd_hash <= 499
;

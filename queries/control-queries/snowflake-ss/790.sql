select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 288 and d.d_hash <= 621 and i.i_hash >= 18 and i.i_hash <= 768 and hd.hd_hash >= 295 and hd.hd_hash <= 695
;

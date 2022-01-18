select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 652 and ss.ss_hash <= 702 and hd.hd_hash >= 260 and hd.hd_hash <= 280 and i.i_hash >= 452 and i.i_hash <= 552
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 55 and ss.ss_hash <= 105 and i.i_hash >= 193 and i.i_hash <= 213 and d.d_hash >= 100 and d.d_hash <= 200
;

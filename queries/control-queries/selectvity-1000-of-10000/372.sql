select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 246 and ss.ss_hash <= 996 and c.c_hash >= 185 and c.c_hash <= 518 and d.d_hash >= 280 and d.d_hash <= 680
;

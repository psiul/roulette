select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 112 and ss.ss_hash <= 862 and d.d_hash >= 185 and d.d_hash <= 518 and c.c_hash >= 346 and c.c_hash <= 746
;

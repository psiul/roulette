select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 563 and ss.ss_hash <= 896 and i.i_hash >= 59 and i.i_hash <= 459 and c.c_hash >= 13 and c.c_hash <= 763
;

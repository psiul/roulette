select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 383 and i.i_hash <= 883 and d.d_hash >= 317 and d.d_hash <= 417 and c.c_hash >= 785 and c.c_hash <= 985
;

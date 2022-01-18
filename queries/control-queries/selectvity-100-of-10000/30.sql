select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 163 and hd.hd_hash <= 263 and d.d_hash >= 417 and d.d_hash <= 617 and i.i_hash >= 383 and i.i_hash <= 883
;

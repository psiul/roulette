select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 421 and ss.ss_hash <= 821 and i.i_hash >= 287 and i.i_hash <= 620 and hd.hd_hash >= 110 and hd.hd_hash <= 860
;

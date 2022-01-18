select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 520 and ss.ss_hash <= 620 and i.i_hash >= 791 and i.i_hash <= 811 and hd.hd_hash >= 320 and hd.hd_hash <= 370
;

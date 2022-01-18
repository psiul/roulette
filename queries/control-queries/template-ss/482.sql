select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 158 and ss.ss_hash <= 908 and i.i_hash >= 329 and i.i_hash <= 729 and c.c_hash >= 480 and c.c_hash <= 813
;

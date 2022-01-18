select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 539 and i.i_hash <= 939 and hd.hd_hash >= 150 and hd.hd_hash <= 900 and d.d_hash >= 445 and d.d_hash <= 778
;

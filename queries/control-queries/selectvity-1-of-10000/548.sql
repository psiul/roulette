select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 797 and ss.ss_hash <= 817 and d.d_hash >= 400 and d.d_hash <= 500 and c.c_hash >= 697 and c.c_hash <= 747
;

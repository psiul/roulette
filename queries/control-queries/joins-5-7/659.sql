select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 362 and ss.ss_hash <= 762 and c.c_hash >= 36 and c.c_hash <= 369 and hd.hd_hash >= 51 and hd.hd_hash <= 801
;

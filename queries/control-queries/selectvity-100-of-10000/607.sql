select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 762 and hd.hd_hash <= 962 and i.i_hash >= 226 and i.i_hash <= 326 and c.c_hash >= 293 and c.c_hash <= 793
;

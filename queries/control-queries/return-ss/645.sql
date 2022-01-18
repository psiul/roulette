select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 303 and c.c_hash <= 703 and i.i_hash >= 212 and i.i_hash <= 962 and d.d_hash >= 304 and d.d_hash <= 637
;

select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 331 and d.d_hash <= 431 and c.c_hash >= 200 and c.c_hash <= 700 and i.i_hash >= 217 and i.i_hash <= 417
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 227 and d.d_hash <= 560 and c.c_hash >= 121 and c.c_hash <= 521 and i.i_hash >= 69 and i.i_hash <= 819
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 194 and c.c_hash <= 944 and d.d_hash >= 539 and d.d_hash <= 939 and hd.hd_hash >= 550 and hd.hd_hash <= 883
;

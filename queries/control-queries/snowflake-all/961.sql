select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 195 and ss.ss_hash <= 945 and c.c_hash >= 619 and c.c_hash <= 952 and d.d_hash >= 97 and d.d_hash <= 497
;

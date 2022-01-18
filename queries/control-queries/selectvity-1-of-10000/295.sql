select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 741 and ss.ss_hash <= 841 and hd.hd_hash >= 945 and hd.hd_hash <= 965 and c.c_hash >= 377 and c.c_hash <= 427
;

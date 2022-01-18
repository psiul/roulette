select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 156 and ss.ss_hash <= 556 and c.c_hash >= 200 and c.c_hash <= 533 and d.d_hash >= 24 and d.d_hash <= 774
;

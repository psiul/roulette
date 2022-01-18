select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 581 and ss.ss_hash <= 981 and d.d_hash >= 200 and d.d_hash <= 950 and c.c_hash >= 422 and c.c_hash <= 755
;

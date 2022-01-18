select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 187 and hd.hd_hash <= 937 and i.i_hash >= 581 and i.i_hash <= 981 and c.c_hash >= 509 and c.c_hash <= 842
;

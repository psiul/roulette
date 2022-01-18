select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 812 and d.d_hash <= 832 and i.i_hash >= 842 and i.i_hash <= 942 and hd.hd_hash >= 229 and hd.hd_hash <= 279
;

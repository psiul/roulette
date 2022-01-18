select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 278 and ss.ss_hash <= 478 and hd.hd_hash >= 87 and hd.hd_hash <= 187 and c.c_hash >= 223 and c.c_hash <= 273
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 106 and hd.hd_hash <= 856 and c.c_hash >= 541 and c.c_hash <= 941 and i.i_hash >= 271 and i.i_hash <= 604
;

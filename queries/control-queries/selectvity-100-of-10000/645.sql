select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 699 and hd.hd_hash <= 899 and i.i_hash >= 130 and i.i_hash <= 230 and d.d_hash >= 309 and d.d_hash <= 809
;

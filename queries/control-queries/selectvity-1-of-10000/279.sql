select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 75 and hd.hd_hash <= 175 and d.d_hash >= 737 and d.d_hash <= 757 and i.i_hash >= 629 and i.i_hash <= 679
;

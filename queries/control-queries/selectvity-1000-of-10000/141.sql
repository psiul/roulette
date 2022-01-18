select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 237 and hd.hd_hash <= 570 and c.c_hash >= 148 and c.c_hash <= 548 and d.d_hash >= 210 and d.d_hash <= 960
;

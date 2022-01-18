select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 617 and hd.hd_hash <= 950 and d.d_hash >= 62 and d.d_hash <= 812 and i.i_hash >= 193 and i.i_hash <= 593
;

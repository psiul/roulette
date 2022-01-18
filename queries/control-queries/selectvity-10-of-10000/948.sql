select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 757 and d.d_hash <= 957 and hd.hd_hash >= 899 and hd.hd_hash <= 999 and i.i_hash >= 114 and i.i_hash <= 164
;

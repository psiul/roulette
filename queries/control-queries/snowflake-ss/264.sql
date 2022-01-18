select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 502 and c.c_hash <= 902 and d.d_hash >= 76 and d.d_hash <= 409 and i.i_hash >= 1 and i.i_hash <= 751
;

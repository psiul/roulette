select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 144 and c.c_hash <= 894 and i.i_hash >= 87 and i.i_hash <= 420 and hd.hd_hash >= 20 and hd.hd_hash <= 420
;

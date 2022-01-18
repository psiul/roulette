select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 216 and i.i_hash <= 966 and c.c_hash >= 453 and c.c_hash <= 786 and hd.hd_hash >= 20 and hd.hd_hash <= 420
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 179 and ss.ss_hash <= 512 and c.c_hash >= 12 and c.c_hash <= 762 and hd.hd_hash >= 257 and hd.hd_hash <= 657
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 307 and ss.ss_hash <= 640 and c.c_hash >= 484 and c.c_hash <= 884 and hd.hd_hash >= 2 and hd.hd_hash <= 752
;

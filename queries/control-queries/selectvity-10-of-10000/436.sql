select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 333 and ss.ss_hash <= 533 and c.c_hash >= 615 and c.c_hash <= 715 and hd.hd_hash >= 65 and hd.hd_hash <= 115
;

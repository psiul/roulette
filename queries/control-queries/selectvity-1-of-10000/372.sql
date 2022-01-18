select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 53 and hd.hd_hash <= 153 and c.c_hash >= 422 and c.c_hash <= 442 and d.d_hash >= 686 and d.d_hash <= 736
;

select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 30 and ss.ss_hash <= 780 and hd.hd_hash >= 568 and hd.hd_hash <= 968 and c.c_hash >= 295 and c.c_hash <= 628
;

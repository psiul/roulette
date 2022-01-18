select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 494 and d.d_hash <= 544 and c.c_hash >= 536 and c.c_hash <= 556 and hd.hd_hash >= 740 and hd.hd_hash <= 840
;

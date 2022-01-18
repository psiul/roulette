select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 611 and ss.ss_hash <= 711 and i.i_hash >= 328 and i.i_hash <= 528 and hd.hd_hash >= 102 and hd.hd_hash <= 602
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 647 and hd.hd_hash <= 747 and c.c_hash >= 355 and c.c_hash <= 405 and i.i_hash >= 402 and i.i_hash <= 602
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 453 and ss.ss_hash <= 953 and d.d_hash >= 279 and d.d_hash <= 479 and i.i_hash >= 483 and i.i_hash <= 583
;

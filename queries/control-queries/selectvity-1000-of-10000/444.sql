select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 291 and ss.ss_hash <= 691 and c.c_hash >= 96 and c.c_hash <= 429 and i.i_hash >= 16 and i.i_hash <= 766
;
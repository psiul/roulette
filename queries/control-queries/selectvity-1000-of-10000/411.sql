select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 559 and i.i_hash <= 892 and c.c_hash >= 240 and c.c_hash <= 990 and d.d_hash >= 96 and d.d_hash <= 496
;

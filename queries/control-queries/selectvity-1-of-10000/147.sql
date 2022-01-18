select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 663 and hd.hd_hash <= 683 and i.i_hash >= 686 and i.i_hash <= 786 and d.d_hash >= 381 and d.d_hash <= 431
;

select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 28 and ss.ss_hash <= 778 and i.i_hash >= 433 and i.i_hash <= 766 and d.d_hash >= 110 and d.d_hash <= 510
;

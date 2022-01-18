select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 20 and c.c_hash <= 770 and i.i_hash >= 332 and i.i_hash <= 732 and d.d_hash >= 546 and d.d_hash <= 879
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 333 and ss.ss_hash <= 533 and i.i_hash >= 756 and i.i_hash <= 856 and d.d_hash >= 510 and d.d_hash <= 560
;

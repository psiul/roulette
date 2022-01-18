select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 356 and ss.ss_hash <= 756 and c.c_hash >= 496 and c.c_hash <= 829 and i.i_hash >= 63 and i.i_hash <= 813
;

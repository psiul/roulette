select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 597 and ss.ss_hash <= 997 and c.c_hash >= 504 and c.c_hash <= 837 and i.i_hash >= 60 and i.i_hash <= 810
;

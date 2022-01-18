select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 115 and ss.ss_hash <= 135 and hd.hd_hash >= 625 and hd.hd_hash <= 675 and i.i_hash >= 388 and i.i_hash <= 488
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 264 and ss.ss_hash <= 664 and hd.hd_hash >= 28 and hd.hd_hash <= 778 and i.i_hash >= 332 and i.i_hash <= 665
;

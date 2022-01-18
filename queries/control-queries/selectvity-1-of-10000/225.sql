select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 855 and ss.ss_hash <= 955 and hd.hd_hash >= 614 and hd.hd_hash <= 664 and i.i_hash >= 767 and i.i_hash <= 787
;

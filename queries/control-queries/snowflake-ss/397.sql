select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 533 and ss.ss_hash <= 866 and d.d_hash >= 7 and d.d_hash <= 757 and hd.hd_hash >= 370 and hd.hd_hash <= 770
;

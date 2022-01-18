select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 553 and hd.hd_hash <= 886 and c.c_hash >= 333 and c.c_hash <= 733 and i.i_hash >= 30 and i.i_hash <= 780
;

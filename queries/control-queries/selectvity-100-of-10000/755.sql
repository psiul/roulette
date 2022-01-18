select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 555 and ss.ss_hash <= 655 and i.i_hash >= 419 and i.i_hash <= 919 and hd.hd_hash >= 496 and hd.hd_hash <= 696
;

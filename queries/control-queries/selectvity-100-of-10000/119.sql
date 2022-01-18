select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 322 and ss.ss_hash <= 822 and hd.hd_hash >= 575 and hd.hd_hash <= 675 and i.i_hash >= 153 and i.i_hash <= 353
;

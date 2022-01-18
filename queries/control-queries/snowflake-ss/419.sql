select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 210 and ss.ss_hash <= 960 and d.d_hash >= 365 and d.d_hash <= 698 and hd.hd_hash >= 491 and hd.hd_hash <= 891
;

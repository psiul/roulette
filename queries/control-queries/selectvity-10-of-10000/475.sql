select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 542 and i.i_hash <= 742 and hd.hd_hash >= 765 and hd.hd_hash <= 865 and c.c_hash >= 570 and c.c_hash <= 620
;

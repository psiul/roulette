select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 181 and hd.hd_hash <= 514 and i.i_hash >= 250 and i.i_hash <= 650 and c.c_hash >= 148 and c.c_hash <= 898
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 250 and ss.ss_hash <= 650 and c.c_hash >= 144 and c.c_hash <= 894 and hd.hd_hash >= 557 and hd.hd_hash <= 890
;

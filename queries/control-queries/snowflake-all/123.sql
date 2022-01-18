select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 20 and d.d_hash <= 353 and c.c_hash >= 139 and c.c_hash <= 889 and i.i_hash >= 593 and i.i_hash <= 993
;

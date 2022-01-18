select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 489 and ss.ss_hash <= 889 and d.d_hash >= 246 and d.d_hash <= 996 and a.ca_hash >= 515 and a.ca_hash <= 848
;

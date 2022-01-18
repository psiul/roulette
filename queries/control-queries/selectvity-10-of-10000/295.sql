select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 286 and ss.ss_hash <= 336 and d.d_hash >= 500 and d.d_hash <= 600 and hd.hd_hash >= 454 and hd.hd_hash <= 654
;

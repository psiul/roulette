select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 284 and c.c_hash <= 384 and a.ca_hash >= 424 and a.ca_hash <= 444 and d.d_hash >= 345 and d.d_hash <= 395
;

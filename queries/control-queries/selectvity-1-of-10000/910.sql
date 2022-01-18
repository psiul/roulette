select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 471 and d.d_hash <= 491 and c.c_hash >= 640 and c.c_hash <= 740 and a.ca_hash >= 109 and a.ca_hash <= 159
;

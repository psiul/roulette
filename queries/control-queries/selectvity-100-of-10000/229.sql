select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 630 and hd.hd_hash <= 730 and c.c_hash >= 71 and c.c_hash <= 271 and a.ca_hash >= 486 and a.ca_hash <= 986
;

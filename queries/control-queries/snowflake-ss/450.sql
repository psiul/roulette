select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 2 and ss.ss_hash <= 402 and c.c_hash >= 152 and c.c_hash <= 902 and hd.hd_hash >= 371 and hd.hd_hash <= 704
;

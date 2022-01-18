select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 101 and ss.ss_hash <= 851 and c.c_hash >= 391 and c.c_hash <= 791 and hd.hd_hash >= 253 and hd.hd_hash <= 586
;

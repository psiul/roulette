select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 154 and ss.ss_hash <= 904 and c.c_hash >= 22 and c.c_hash <= 355 and a.ca_hash >= 455 and a.ca_hash <= 855
;

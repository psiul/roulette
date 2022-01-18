select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 16 and ss.ss_hash <= 349 and c.c_hash >= 500 and c.c_hash <= 900 and a.ca_hash >= 182 and a.ca_hash <= 932
;

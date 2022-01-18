select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 349 and ss.ss_hash <= 749 and c.c_hash >= 20 and c.c_hash <= 353 and hd.hd_hash >= 15 and hd.hd_hash <= 765
;

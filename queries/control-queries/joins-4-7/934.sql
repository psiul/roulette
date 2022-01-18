select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 377 and ss.ss_hash <= 777 and c.c_hash >= 176 and c.c_hash <= 509 and a.ca_hash >= 64 and a.ca_hash <= 814
;

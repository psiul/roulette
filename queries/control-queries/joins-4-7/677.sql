select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 124 and ss.ss_hash <= 874 and c.c_hash >= 315 and c.c_hash <= 648 and a.ca_hash >= 68 and a.ca_hash <= 468
;

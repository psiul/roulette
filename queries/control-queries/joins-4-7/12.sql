select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 103 and ss.ss_hash <= 853 and c.c_hash >= 92 and c.c_hash <= 492 and a.ca_hash >= 119 and a.ca_hash <= 452
;

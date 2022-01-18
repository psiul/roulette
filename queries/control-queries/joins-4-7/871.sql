select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 665 and ss.ss_hash <= 998 and c.c_hash >= 220 and c.c_hash <= 620 and a.ca_hash >= 197 and a.ca_hash <= 947
;

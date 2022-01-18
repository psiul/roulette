select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 68 and ss.ss_hash <= 401 and c.c_hash >= 178 and c.c_hash <= 928 and a.ca_hash >= 357 and a.ca_hash <= 757
;

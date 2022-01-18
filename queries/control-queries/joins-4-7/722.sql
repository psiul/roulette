select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 94 and ss.ss_hash <= 427 and c.c_hash >= 248 and c.c_hash <= 998 and hd.hd_hash >= 376 and hd.hd_hash <= 776
;

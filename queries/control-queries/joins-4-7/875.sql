select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 637 and ss.ss_hash <= 970 and hd.hd_hash >= 305 and hd.hd_hash <= 705 and c.c_hash >= 26 and c.c_hash <= 776
;

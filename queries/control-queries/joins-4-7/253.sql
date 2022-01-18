select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 63 and ss.ss_hash <= 463 and c.c_hash >= 567 and c.c_hash <= 900 and a.ca_hash >= 157 and a.ca_hash <= 907
;

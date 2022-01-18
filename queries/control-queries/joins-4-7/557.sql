select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 205 and ss.ss_hash <= 955 and a.ca_hash >= 570 and a.ca_hash <= 903 and hd.hd_hash >= 216 and hd.hd_hash <= 616
;

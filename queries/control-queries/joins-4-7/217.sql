select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 480 and c.c_hash <= 813 and a.ca_hash >= 225 and a.ca_hash <= 975 and hd.hd_hash >= 264 and hd.hd_hash <= 664
;

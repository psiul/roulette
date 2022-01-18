select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 435 and ss.ss_hash <= 768 and c.c_hash >= 22 and c.c_hash <= 772 and hd.hd_hash >= 384 and hd.hd_hash <= 784
;

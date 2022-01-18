select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 439 and ss.ss_hash <= 839 and hd.hd_hash >= 586 and hd.hd_hash <= 919 and a.ca_hash >= 123 and a.ca_hash <= 873
;

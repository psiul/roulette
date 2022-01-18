select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 657 and hd.hd_hash <= 990 and c.c_hash >= 154 and c.c_hash <= 554 and a.ca_hash >= 187 and a.ca_hash <= 937
;

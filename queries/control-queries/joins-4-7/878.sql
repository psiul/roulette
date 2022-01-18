select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 214 and c.c_hash <= 964 and hd.hd_hash >= 466 and hd.hd_hash <= 866 and a.ca_hash >= 659 and a.ca_hash <= 992
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 202 and ss.ss_hash <= 535 and c.c_hash >= 118 and c.c_hash <= 868 and a.ca_hash >= 130 and a.ca_hash <= 530
;

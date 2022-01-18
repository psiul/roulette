select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 160 and ss.ss_hash <= 493 and c.c_hash >= 440 and c.c_hash <= 840 and a.ca_hash >= 233 and a.ca_hash <= 983
;

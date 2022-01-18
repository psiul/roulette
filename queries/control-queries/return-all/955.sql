select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 661 and c.c_hash <= 994 and a.ca_hash >= 96 and a.ca_hash <= 496 and hd.hd_hash >= 19 and hd.hd_hash <= 769
;

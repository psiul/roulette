select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,store_returns sr,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 242 and ss.ss_hash <= 992 and hd.hd_hash >= 245 and hd.hd_hash <= 578 and a.ca_hash >= 11 and a.ca_hash <= 411
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,store_returns sr,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 48 and c.c_hash <= 798 and a.ca_hash >= 502 and a.ca_hash <= 902 and hd.hd_hash >= 379 and hd.hd_hash <= 712
;

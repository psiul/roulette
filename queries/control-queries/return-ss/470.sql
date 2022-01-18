select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 142 and ss.ss_hash <= 892 and hd.hd_hash >= 153 and hd.hd_hash <= 553 and a.ca_hash >= 53 and a.ca_hash <= 386
;

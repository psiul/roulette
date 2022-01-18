select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer c,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 611 and ss.ss_hash <= 944 and hd.hd_hash >= 538 and hd.hd_hash <= 938 and a.ca_hash >= 235 and a.ca_hash <= 985
;

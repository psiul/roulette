select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_hash >= 126 and c.c_hash <= 876 and a.ca_hash >= 587 and a.ca_hash <= 987 and hd.hd_hash >= 612 and hd.hd_hash <= 945
;

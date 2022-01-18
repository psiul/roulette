select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 299 and ss.ss_hash <= 699 and hd.hd_hash >= 565 and hd.hd_hash <= 898 and a.ca_hash >= 5 and a.ca_hash <= 755
;

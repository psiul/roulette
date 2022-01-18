select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,household_demographics hd,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 227 and c.c_hash <= 977 and hd.hd_hash >= 342 and hd.hd_hash <= 675 and a.ca_hash >= 293 and a.ca_hash <= 693
;

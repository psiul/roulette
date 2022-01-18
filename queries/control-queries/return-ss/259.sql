select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 287 and ss.ss_hash <= 620 and c.c_hash >= 523 and c.c_hash <= 923 and a.ca_hash >= 85 and a.ca_hash <= 835
;

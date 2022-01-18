select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer c,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 249 and ss.ss_hash <= 999 and i.i_hash >= 77 and i.i_hash <= 477 and a.ca_hash >= 97 and a.ca_hash <= 430
;

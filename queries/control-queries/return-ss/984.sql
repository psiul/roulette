select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 247 and ss.ss_hash <= 997 and c.c_hash >= 404 and c.c_hash <= 737 and a.ca_hash >= 467 and a.ca_hash <= 867
;

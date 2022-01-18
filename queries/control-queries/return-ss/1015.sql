select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 120 and ss.ss_hash <= 520 and i.i_hash >= 423 and i.i_hash <= 756 and c.c_hash >= 213 and c.c_hash <= 963
;

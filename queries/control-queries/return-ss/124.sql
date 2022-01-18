select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,item i,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and sr.sr_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 379 and c.c_hash <= 779 and i.i_hash >= 551 and i.i_hash <= 884 and a.ca_hash >= 64 and a.ca_hash <= 814
;

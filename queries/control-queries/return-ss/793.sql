select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,store_returns sr,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 423 and ss.ss_hash <= 823 and c.c_hash >= 15 and c.c_hash <= 348 and i.i_hash >= 136 and i.i_hash <= 886
;

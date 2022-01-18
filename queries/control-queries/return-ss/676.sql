select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,store_returns sr,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 191 and ss.ss_hash <= 941 and i.i_hash >= 561 and i.i_hash <= 961 and a.ca_hash >= 100 and a.ca_hash <= 433
;

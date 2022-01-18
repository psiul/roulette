select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,store_returns sr,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 185 and i.i_hash <= 935 and c.c_hash >= 380 and c.c_hash <= 780 and a.ca_hash >= 513 and a.ca_hash <= 846
;

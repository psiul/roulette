select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,store_returns sr,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 448 and ss.ss_hash <= 781 and c.c_hash >= 491 and c.c_hash <= 891 and i.i_hash >= 133 and i.i_hash <= 883
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 547 and ss.ss_hash <= 947 and c.c_hash >= 232 and c.c_hash <= 982 and i.i_hash >= 136 and i.i_hash <= 469
;

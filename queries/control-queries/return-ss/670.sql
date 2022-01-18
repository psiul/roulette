select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,date_dim d,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 440 and ss.ss_hash <= 773 and d.d_hash >= 223 and d.d_hash <= 973 and a.ca_hash >= 259 and a.ca_hash <= 659
;

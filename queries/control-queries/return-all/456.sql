select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_addr_sk = a.ca_address_sk and sr.sr_returned_date_sk = d.d_date_sk and c.c_hash >= 410 and c.c_hash <= 810 and a.ca_hash >= 183 and a.ca_hash <= 933 and d.d_hash >= 464 and d.d_hash <= 797
;

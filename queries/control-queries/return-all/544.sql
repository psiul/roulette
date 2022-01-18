select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,date_dim d,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and sr.sr_returned_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 184 and c.c_hash <= 934 and d.d_hash >= 107 and d.d_hash <= 440 and a.ca_hash >= 282 and a.ca_hash <= 682
;

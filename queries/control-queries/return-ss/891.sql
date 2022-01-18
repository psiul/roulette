select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer c,customer_address a
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 651 and ss.ss_hash <= 984 and c.c_hash >= 91 and c.c_hash <= 491 and a.ca_hash >= 14 and a.ca_hash <= 764
;

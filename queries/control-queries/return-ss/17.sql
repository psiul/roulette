select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 490 and ss.ss_hash <= 890 and d.d_hash >= 204 and d.d_hash <= 954 and a.ca_hash >= 465 and a.ca_hash <= 798
;
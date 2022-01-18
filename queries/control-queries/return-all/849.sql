select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 311 and d.d_hash <= 711 and c.c_hash >= 157 and c.c_hash <= 907 and a.ca_hash >= 571 and a.ca_hash <= 904
;

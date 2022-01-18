select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 635 and i.i_hash <= 968 and c.c_hash >= 96 and c.c_hash <= 496 and a.ca_hash >= 107 and a.ca_hash <= 857
;

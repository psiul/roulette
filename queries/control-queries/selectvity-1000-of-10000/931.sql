select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 201 and c.c_hash <= 951 and i.i_hash >= 253 and i.i_hash <= 586 and a.ca_hash >= 583 and a.ca_hash <= 983
;

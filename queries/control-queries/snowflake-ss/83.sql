select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 331 and c.c_hash <= 731 and i.i_hash >= 76 and i.i_hash <= 409 and a.ca_hash >= 186 and a.ca_hash <= 936
;

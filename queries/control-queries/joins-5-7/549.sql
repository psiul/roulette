select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 57 and ss.ss_hash <= 807 and i.i_hash >= 237 and i.i_hash <= 570 and d.d_hash >= 507 and d.d_hash <= 907
;

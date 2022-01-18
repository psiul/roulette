select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 478 and ss.ss_hash <= 978 and d.d_hash >= 37 and d.d_hash <= 237 and i.i_hash >= 842 and i.i_hash <= 942
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 640 and i.i_hash <= 973 and d.d_hash >= 111 and d.d_hash <= 861 and a.ca_hash >= 113 and a.ca_hash <= 513
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 187 and i.i_hash <= 520 and c.c_hash >= 242 and c.c_hash <= 992 and a.ca_hash >= 345 and a.ca_hash <= 745
;

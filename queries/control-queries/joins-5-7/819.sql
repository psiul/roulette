select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 49 and ss.ss_hash <= 382 and c.c_hash >= 49 and c.c_hash <= 799 and i.i_hash >= 104 and i.i_hash <= 504
;

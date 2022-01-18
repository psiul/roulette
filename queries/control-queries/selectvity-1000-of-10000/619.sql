select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 223 and i.i_hash <= 973 and d.d_hash >= 506 and d.d_hash <= 906 and a.ca_hash >= 113 and a.ca_hash <= 446
;

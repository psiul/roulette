select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 42 and ss.ss_hash <= 375 and c.c_hash >= 159 and c.c_hash <= 559 and a.ca_hash >= 155 and a.ca_hash <= 905
;

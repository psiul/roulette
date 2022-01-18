select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 49 and ss.ss_hash <= 449 and a.ca_hash >= 624 and a.ca_hash <= 957 and d.d_hash >= 47 and d.d_hash <= 797
;

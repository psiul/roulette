select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 561 and c.c_hash <= 894 and d.d_hash >= 414 and d.d_hash <= 814 and a.ca_hash >= 228 and a.ca_hash <= 978
;

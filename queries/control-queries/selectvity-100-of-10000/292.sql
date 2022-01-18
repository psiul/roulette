select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 492 and ss.ss_hash <= 992 and c.c_hash >= 224 and c.c_hash <= 424 and a.ca_hash >= 134 and a.ca_hash <= 234
;

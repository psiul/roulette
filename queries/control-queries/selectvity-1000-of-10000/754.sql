select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 300 and c.c_hash <= 633 and a.ca_hash >= 178 and a.ca_hash <= 928 and d.d_hash >= 78 and d.d_hash <= 478
;

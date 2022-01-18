select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 615 and d.d_hash <= 665 and a.ca_hash >= 172 and a.ca_hash <= 192 and i.i_hash >= 553 and i.i_hash <= 653
;

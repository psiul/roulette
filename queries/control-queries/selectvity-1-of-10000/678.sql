select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 129 and ss.ss_hash <= 229 and d.d_hash >= 872 and d.d_hash <= 892 and a.ca_hash >= 735 and a.ca_hash <= 785
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 199 and d.d_hash <= 949 and a.ca_hash >= 202 and a.ca_hash <= 535 and i.i_hash >= 527 and i.i_hash <= 927
;

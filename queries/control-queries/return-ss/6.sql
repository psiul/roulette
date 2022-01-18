select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 81 and ss.ss_hash <= 481 and a.ca_hash >= 299 and a.ca_hash <= 632 and i.i_hash >= 151 and i.i_hash <= 901
;

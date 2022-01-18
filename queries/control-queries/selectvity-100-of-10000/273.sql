select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 402 and c.c_hash <= 902 and a.ca_hash >= 376 and a.ca_hash <= 576 and i.i_hash >= 359 and i.i_hash <= 459
;

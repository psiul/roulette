select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 37 and ss.ss_hash <= 787 and i.i_hash >= 647 and i.i_hash <= 980 and c.c_hash >= 7 and c.c_hash <= 407
;

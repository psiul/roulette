select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 540 and ss.ss_hash <= 590 and c.c_hash >= 371 and c.c_hash <= 571 and i.i_hash >= 660 and i.i_hash <= 760
;

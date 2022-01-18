select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 565 and ss.ss_hash <= 765 and i.i_hash >= 370 and i.i_hash <= 420 and a.ca_hash >= 546 and a.ca_hash <= 646
;

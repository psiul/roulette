select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 92 and ss.ss_hash <= 492 and i.i_hash >= 160 and i.i_hash <= 910 and c.c_hash >= 416 and c.c_hash <= 749
;

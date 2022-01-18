select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 140 and ss.ss_hash <= 890 and d.d_hash >= 404 and d.d_hash <= 737 and i.i_hash >= 150 and i.i_hash <= 550
;

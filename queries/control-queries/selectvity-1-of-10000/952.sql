select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 336 and ss.ss_hash <= 436 and c.c_hash >= 549 and c.c_hash <= 599 and d.d_hash >= 738 and d.d_hash <= 758
;

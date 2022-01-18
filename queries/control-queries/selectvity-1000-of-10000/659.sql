select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 44 and ss.ss_hash <= 794 and d.d_hash >= 348 and d.d_hash <= 748 and a.ca_hash >= 644 and a.ca_hash <= 977
;

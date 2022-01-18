select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 876 and c.c_hash <= 926 and i.i_hash >= 243 and i.i_hash <= 443 and d.d_hash >= 172 and d.d_hash <= 272
;

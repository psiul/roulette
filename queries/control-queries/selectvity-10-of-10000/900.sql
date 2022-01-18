select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 86 and i.i_hash <= 286 and a.ca_hash >= 889 and a.ca_hash <= 989 and d.d_hash >= 821 and d.d_hash <= 871
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 617 and c.c_hash <= 817 and i.i_hash >= 772 and i.i_hash <= 872 and a.ca_hash >= 919 and a.ca_hash <= 969
;

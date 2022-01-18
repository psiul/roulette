select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 556 and ss.ss_hash <= 956 and a.ca_hash >= 68 and a.ca_hash <= 818 and i.i_hash >= 539 and i.i_hash <= 872
;

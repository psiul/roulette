select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 647 and c.c_hash <= 697 and i.i_hash >= 912 and i.i_hash <= 932 and a.ca_hash >= 680 and a.ca_hash <= 780
;

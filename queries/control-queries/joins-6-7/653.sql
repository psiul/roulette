select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_address a,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 55 and ss.ss_hash <= 388 and i.i_hash >= 332 and i.i_hash <= 732 and a.ca_hash >= 218 and a.ca_hash <= 968
;

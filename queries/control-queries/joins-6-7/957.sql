select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 531 and ss.ss_hash <= 864 and d.d_hash >= 218 and d.d_hash <= 968 and a.ca_hash >= 294 and a.ca_hash <= 694
;

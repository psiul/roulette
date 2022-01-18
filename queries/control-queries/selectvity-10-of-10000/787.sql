select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 751 and ss.ss_hash <= 851 and d.d_hash >= 174 and d.d_hash <= 374 and a.ca_hash >= 216 and a.ca_hash <= 266
;

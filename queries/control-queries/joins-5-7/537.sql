select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 552 and c.c_hash <= 952 and a.ca_hash >= 505 and a.ca_hash <= 838 and cd.cd_hash >= 97 and cd.cd_hash <= 847
;

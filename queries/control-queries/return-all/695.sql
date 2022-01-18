select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 168 and ss.ss_hash <= 918 and a.ca_hash >= 54 and a.ca_hash <= 454 and cd.cd_hash >= 299 and cd.cd_hash <= 632
;

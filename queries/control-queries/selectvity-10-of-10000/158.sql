select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 843 and c.c_hash <= 893 and cd.cd_hash >= 504 and cd.cd_hash <= 704 and d.d_hash >= 550 and d.d_hash <= 650
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 109 and ss.ss_hash <= 309 and c.c_hash >= 65 and c.c_hash <= 115 and cd.cd_hash >= 874 and cd.cd_hash <= 974
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 349 and ss.ss_hash <= 399 and cd.cd_hash >= 526 and cd.cd_hash <= 626 and a.ca_hash >= 125 and a.ca_hash <= 325
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 137 and ss.ss_hash <= 887 and c.c_hash >= 267 and c.c_hash <= 667 and cd.cd_hash >= 652 and cd.cd_hash <= 985
;

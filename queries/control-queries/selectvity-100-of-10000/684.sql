select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 756 and c.c_hash <= 856 and a.ca_hash >= 207 and a.ca_hash <= 707 and cd.cd_hash >= 785 and cd.cd_hash <= 985
;

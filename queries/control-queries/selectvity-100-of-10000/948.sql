select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 612 and ss.ss_hash <= 812 and cd.cd_hash >= 243 and cd.cd_hash <= 343 and a.ca_hash >= 246 and a.ca_hash <= 746
;

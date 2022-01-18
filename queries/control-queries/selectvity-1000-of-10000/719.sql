select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 249 and ss.ss_hash <= 999 and cd.cd_hash >= 242 and cd.cd_hash <= 642 and d.d_hash >= 296 and d.d_hash <= 629
;

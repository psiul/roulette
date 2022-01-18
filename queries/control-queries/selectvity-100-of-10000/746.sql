select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 389 and c.c_hash <= 489 and cd.cd_hash >= 176 and cd.cd_hash <= 376 and a.ca_hash >= 18 and a.ca_hash <= 518
;

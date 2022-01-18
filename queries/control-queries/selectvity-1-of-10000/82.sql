select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 455 and ss.ss_hash <= 475 and c.c_hash >= 112 and c.c_hash <= 162 and cd.cd_hash >= 4 and cd.cd_hash <= 104
;

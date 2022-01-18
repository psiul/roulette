select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 11 and c.c_hash <= 511 and a.ca_hash >= 513 and a.ca_hash <= 713 and cd.cd_hash >= 879 and cd.cd_hash <= 979
;

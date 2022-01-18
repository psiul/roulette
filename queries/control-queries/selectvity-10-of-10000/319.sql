select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 755 and ss.ss_hash <= 855 and c.c_hash >= 47 and c.c_hash <= 97 and cd.cd_hash >= 151 and cd.cd_hash <= 351
;

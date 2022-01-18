select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 119 and ss.ss_hash <= 219 and cd.cd_hash >= 812 and cd.cd_hash <= 832 and c.c_hash >= 423 and c.c_hash <= 473
;

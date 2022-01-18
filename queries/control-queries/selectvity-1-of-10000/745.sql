select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 145 and cd.cd_hash <= 165 and c.c_hash >= 380 and c.c_hash <= 430 and a.ca_hash >= 143 and a.ca_hash <= 243
;

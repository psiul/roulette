select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 502 and ss.ss_hash <= 835 and c.c_hash >= 29 and c.c_hash <= 429 and a.ca_hash >= 238 and a.ca_hash <= 988
;

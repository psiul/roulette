select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 313 and ss.ss_hash <= 513 and c.c_hash >= 71 and c.c_hash <= 171 and a.ca_hash >= 152 and a.ca_hash <= 652
;

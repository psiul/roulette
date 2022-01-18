select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 113 and ss.ss_hash <= 513 and c.c_hash >= 427 and c.c_hash <= 760 and a.ca_hash >= 188 and a.ca_hash <= 938
;

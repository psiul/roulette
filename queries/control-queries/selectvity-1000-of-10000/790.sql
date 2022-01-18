select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 80 and ss.ss_hash <= 413 and c.c_hash >= 443 and c.c_hash <= 843 and a.ca_hash >= 79 and a.ca_hash <= 829
;

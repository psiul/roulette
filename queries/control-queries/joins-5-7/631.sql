select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 110 and ss.ss_hash <= 860 and c.c_hash >= 500 and c.c_hash <= 900 and a.ca_hash >= 393 and a.ca_hash <= 726
;

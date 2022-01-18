select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 419 and d.d_hash <= 519 and c.c_hash >= 710 and c.c_hash <= 910 and a.ca_hash >= 37 and a.ca_hash <= 537
;

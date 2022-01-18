select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 12 and ss.ss_hash <= 762 and c.c_hash >= 195 and c.c_hash <= 528 and a.ca_hash >= 347 and a.ca_hash <= 747
;

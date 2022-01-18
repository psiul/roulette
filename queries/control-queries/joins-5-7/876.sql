select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 95 and ss.ss_hash <= 845 and c.c_hash >= 207 and c.c_hash <= 607 and a.ca_hash >= 229 and a.ca_hash <= 562
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 251 and ss.ss_hash <= 651 and a.ca_hash >= 24 and a.ca_hash <= 774 and d.d_hash >= 504 and d.d_hash <= 837
;

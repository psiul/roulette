select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 102 and ss.ss_hash <= 202 and c.c_hash >= 141 and c.c_hash <= 161 and a.ca_hash >= 656 and a.ca_hash <= 706
;

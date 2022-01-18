select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 323 and ss.ss_hash <= 656 and d.d_hash >= 73 and d.d_hash <= 823 and a.ca_hash >= 599 and a.ca_hash <= 999
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 473 and ss.ss_hash <= 806 and c.c_hash >= 160 and c.c_hash <= 560 and a.ca_hash >= 44 and a.ca_hash <= 794
;

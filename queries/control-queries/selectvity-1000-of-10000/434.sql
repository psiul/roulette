select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 336 and d.d_hash <= 669 and c.c_hash >= 259 and c.c_hash <= 659 and a.ca_hash >= 160 and a.ca_hash <= 910
;

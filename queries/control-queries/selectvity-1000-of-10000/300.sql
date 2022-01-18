select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 221 and cd.cd_hash <= 971 and c.c_hash >= 295 and c.c_hash <= 695 and d.d_hash >= 81 and d.d_hash <= 414
;

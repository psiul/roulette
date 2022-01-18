select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 484 and c.c_hash <= 817 and d.d_hash >= 82 and d.d_hash <= 832 and cd.cd_hash >= 259 and cd.cd_hash <= 659
;

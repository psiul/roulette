select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 25 and ss.ss_hash <= 125 and cd.cd_hash >= 482 and cd.cd_hash <= 682 and c.c_hash >= 493 and c.c_hash <= 993
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 577 and ss.ss_hash <= 677 and cd.cd_hash >= 794 and cd.cd_hash <= 814 and a.ca_hash >= 872 and a.ca_hash <= 922
;

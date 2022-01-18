select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 37 and ss.ss_hash <= 537 and a.ca_hash >= 591 and a.ca_hash <= 691 and cd.cd_hash >= 424 and cd.cd_hash <= 624
;

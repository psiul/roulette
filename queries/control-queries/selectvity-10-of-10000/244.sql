select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 538 and d.d_hash <= 588 and a.ca_hash >= 691 and a.ca_hash <= 791 and cd.cd_hash >= 13 and cd.cd_hash <= 213
;

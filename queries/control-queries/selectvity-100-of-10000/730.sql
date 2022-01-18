select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 327 and ss.ss_hash <= 427 and a.ca_hash >= 78 and a.ca_hash <= 578 and cd.cd_hash >= 301 and cd.cd_hash <= 501
;

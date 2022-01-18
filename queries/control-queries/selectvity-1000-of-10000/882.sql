select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 415 and d.d_hash <= 815 and cd.cd_hash >= 341 and cd.cd_hash <= 674 and a.ca_hash >= 29 and a.ca_hash <= 779
;

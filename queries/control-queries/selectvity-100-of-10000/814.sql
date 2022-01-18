select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 624 and cd.cd_hash <= 724 and a.ca_hash >= 71 and a.ca_hash <= 571 and d.d_hash >= 403 and d.d_hash <= 603
;

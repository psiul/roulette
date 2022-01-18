select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 633 and ss.ss_hash <= 966 and cd.cd_hash >= 101 and cd.cd_hash <= 851 and a.ca_hash >= 339 and a.ca_hash <= 739
;

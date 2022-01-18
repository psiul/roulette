select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_address a,customer_demographics cd,date_dim d
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and a.ca_hash >= 41 and a.ca_hash <= 374 and cd.cd_hash >= 100 and cd.cd_hash <= 850 and d.d_hash >= 8 and d.d_hash <= 408
;

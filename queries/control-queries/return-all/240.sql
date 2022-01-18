select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_address a,customer_demographics cd,catalog_returns cr
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and c.c_hash >= 32 and c.c_hash <= 782 and a.ca_hash >= 205 and a.ca_hash <= 605 and cd.cd_hash >= 3 and cd.cd_hash <= 336
;

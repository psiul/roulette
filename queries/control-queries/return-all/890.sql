select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,catalog_returns cr,customer c,customer_address a
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 68 and cs.cs_hash <= 818 and cd.cd_hash >= 75 and cd.cd_hash <= 475 and a.ca_hash >= 289 and a.ca_hash <= 622
;

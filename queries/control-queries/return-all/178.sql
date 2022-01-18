select count(cs.cs_item_sk)
from catalog_sales cs,customer c,catalog_returns cr,customer_address a,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 75 and cs.cs_hash <= 475 and c.c_hash >= 224 and c.c_hash <= 557 and a.ca_hash >= 129 and a.ca_hash <= 879
;

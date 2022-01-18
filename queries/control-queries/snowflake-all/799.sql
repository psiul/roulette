select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_demographics cd,customer_address a,warehouse w
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 124 and cs.cs_hash <= 524 and c.c_hash >= 274 and c.c_hash <= 607 and a.ca_hash >= 18 and a.ca_hash <= 768
;

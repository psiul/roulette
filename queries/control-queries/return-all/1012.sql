select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer c,customer_address a,customer_demographics cd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 202 and cs.cs_hash <= 602 and c.c_hash >= 182 and c.c_hash <= 932 and cd.cd_hash >= 91 and cd.cd_hash <= 424
;

select count(cs.cs_item_sk)
from catalog_sales cs,customer c,warehouse w,customer_demographics cd,customer_address a
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 581 and cs.cs_hash <= 981 and c.c_hash >= 101 and c.c_hash <= 851 and a.ca_hash >= 655 and a.ca_hash <= 988
;

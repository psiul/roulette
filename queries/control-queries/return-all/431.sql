select count(cs.cs_item_sk)
from catalog_sales cs,customer c,ship_mode sm,customer_address a,warehouse w
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and c.c_hash >= 7 and c.c_hash <= 757 and sm.sm_hash >= 131 and sm.sm_hash <= 464 and a.ca_hash >= 338 and a.ca_hash <= 738
;

select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_address a,ship_mode sm,warehouse w
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and c.c_hash >= 46 and c.c_hash <= 796 and a.ca_hash >= 316 and a.ca_hash <= 649 and sm.sm_hash >= 351 and sm.sm_hash <= 751
;

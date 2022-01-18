select count(cs.cs_item_sk)
from catalog_sales cs,customer c,warehouse w,customer_address a,ship_mode sm
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_hash >= 433 and c.c_hash <= 766 and a.ca_hash >= 437 and a.ca_hash <= 837 and sm.sm_hash >= 214 and sm.sm_hash <= 964
;

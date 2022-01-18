select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,warehouse w,customer c,customer_address a
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 504 and cs.cs_hash <= 904 and sm.sm_hash >= 130 and sm.sm_hash <= 880 and a.ca_hash >= 523 and a.ca_hash <= 856
;

select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,ship_mode sm,warehouse w,customer c
where cs.cs_order_number = cr.cr_order_number and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 121 and cs.cs_hash <= 454 and sm.sm_hash >= 45 and sm.sm_hash <= 795 and c.c_hash >= 32 and c.c_hash <= 432
;

select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer c,item i,ship_mode sm
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_hash >= 75 and c.c_hash <= 825 and i.i_hash >= 510 and i.i_hash <= 910 and sm.sm_hash >= 296 and sm.sm_hash <= 629
;

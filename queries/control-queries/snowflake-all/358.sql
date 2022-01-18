select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,warehouse w,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 208 and cs.cs_hash <= 958 and i.i_hash >= 581 and i.i_hash <= 981 and c.c_hash >= 160 and c.c_hash <= 493
;

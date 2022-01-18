select count(cs.cs_item_sk)
from catalog_sales cs,customer c,item i,warehouse w,ship_mode sm
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_hash >= 305 and c.c_hash <= 638 and i.i_hash >= 35 and i.i_hash <= 785 and sm.sm_hash >= 154 and sm.sm_hash <= 554
;

select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,customer c,warehouse w
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 378 and cs.cs_hash <= 778 and i.i_hash >= 266 and i.i_hash <= 599 and c.c_hash >= 220 and c.c_hash <= 970
;

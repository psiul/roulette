select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,item i,warehouse w,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 197 and cs.cs_hash <= 530 and i.i_hash >= 154 and i.i_hash <= 904 and c.c_hash >= 562 and c.c_hash <= 962
;

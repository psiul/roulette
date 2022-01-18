select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,ship_mode sm,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 177 and cs.cs_hash <= 927 and sm.sm_hash >= 270 and sm.sm_hash <= 603 and c.c_hash >= 496 and c.c_hash <= 896
;

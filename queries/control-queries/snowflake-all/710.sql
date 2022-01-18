select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,ship_mode sm,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 27 and cs.cs_hash <= 777 and sm.sm_hash >= 492 and sm.sm_hash <= 892 and c.c_hash >= 293 and c.c_hash <= 626
;

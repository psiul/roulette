select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,warehouse w,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 119 and cs.cs_hash <= 519 and sm.sm_hash >= 34 and sm.sm_hash <= 784 and d.d_hash >= 511 and d.d_hash <= 844
;

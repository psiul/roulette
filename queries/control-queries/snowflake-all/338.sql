select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,warehouse w,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 332 and cs.cs_hash <= 665 and sm.sm_hash >= 26 and sm.sm_hash <= 426 and d.d_hash >= 233 and d.d_hash <= 983
;

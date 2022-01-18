select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,customer_demographics cd,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 119 and d.d_hash <= 519 and cd.cd_hash >= 53 and cd.cd_hash <= 386 and sm.sm_hash >= 121 and sm.sm_hash <= 871
;

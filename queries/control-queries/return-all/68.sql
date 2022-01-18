select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,warehouse w,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 610 and cs.cs_hash <= 943 and cd.cd_hash >= 110 and cd.cd_hash <= 860 and sm.sm_hash >= 437 and sm.sm_hash <= 837
;

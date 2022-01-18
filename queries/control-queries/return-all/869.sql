select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,customer_demographics cd,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 568 and cs.cs_hash <= 968 and d.d_hash >= 553 and d.d_hash <= 886 and cd.cd_hash >= 124 and cd.cd_hash <= 874
;

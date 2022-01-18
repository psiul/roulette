select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer_demographics cd,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and d.d_hash >= 623 and d.d_hash <= 956 and sm.sm_hash >= 226 and sm.sm_hash <= 976 and cd.cd_hash >= 519 and cd.cd_hash <= 919
;

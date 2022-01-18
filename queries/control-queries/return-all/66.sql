select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer_demographics cd,date_dim d,warehouse w
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and sm.sm_hash >= 378 and sm.sm_hash <= 711 and cd.cd_hash >= 11 and cd.cd_hash <= 761 and d.d_hash >= 410 and d.d_hash <= 810
;

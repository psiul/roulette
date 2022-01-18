select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,date_dim d,warehouse w
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cd.cd_hash >= 156 and cd.cd_hash <= 906 and sm.sm_hash >= 191 and sm.sm_hash <= 591 and d.d_hash >= 386 and d.d_hash <= 719
;

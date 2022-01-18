select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer_demographics cd,warehouse w,date_dim d
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and sm.sm_hash >= 191 and sm.sm_hash <= 941 and cd.cd_hash >= 353 and cd.cd_hash <= 686 and d.d_hash >= 534 and d.d_hash <= 934
;

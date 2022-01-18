select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,ship_mode sm,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 477 and cs.cs_hash <= 877 and cd.cd_hash >= 362 and cd.cd_hash <= 695 and sm.sm_hash >= 193 and sm.sm_hash <= 943
;

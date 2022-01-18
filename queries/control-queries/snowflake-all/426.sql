select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,ship_mode sm,warehouse w
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cd.cd_hash >= 282 and cd.cd_hash <= 615 and d.d_hash >= 247 and d.d_hash <= 647 and sm.sm_hash >= 219 and sm.sm_hash <= 969
;

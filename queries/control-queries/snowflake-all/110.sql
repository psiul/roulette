select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,ship_mode sm,warehouse w
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 227 and cs.cs_hash <= 627 and cd.cd_hash >= 503 and cd.cd_hash <= 836 and sm.sm_hash >= 90 and sm.sm_hash <= 840
;

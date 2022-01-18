select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,warehouse w,item i
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 135 and cs.cs_hash <= 468 and cd.cd_hash >= 105 and cd.cd_hash <= 505 and sm.sm_hash >= 100 and sm.sm_hash <= 850
;

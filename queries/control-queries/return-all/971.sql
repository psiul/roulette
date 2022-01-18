select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,customer_demographics cd,warehouse w
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 267 and cs.cs_hash <= 667 and sm.sm_hash >= 201 and sm.sm_hash <= 951 and cd.cd_hash >= 387 and cd.cd_hash <= 720
;

select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer_demographics cd,item i,ship_mode sm
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cd.cd_hash >= 345 and cd.cd_hash <= 745 and i.i_hash >= 98 and i.i_hash <= 848 and sm.sm_hash >= 53 and sm.sm_hash <= 386
;

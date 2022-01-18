select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,item i,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 162 and cs.cs_hash <= 495 and i.i_hash >= 137 and i.i_hash <= 887 and sm.sm_hash >= 418 and sm.sm_hash <= 818
;

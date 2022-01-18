select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,ship_mode sm,warehouse w
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cd.cd_hash >= 110 and cd.cd_hash <= 443 and i.i_hash >= 124 and i.i_hash <= 874 and sm.sm_hash >= 218 and sm.sm_hash <= 618
;

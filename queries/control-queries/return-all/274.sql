select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,warehouse w,household_demographics hd
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 98 and cs.cs_hash <= 498 and cd.cd_hash >= 514 and cd.cd_hash <= 847 and sm.sm_hash >= 87 and sm.sm_hash <= 837
;

select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,household_demographics hd,ship_mode sm,customer_demographics cd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 410 and cs.cs_hash <= 743 and sm.sm_hash >= 98 and sm.sm_hash <= 848 and cd.cd_hash >= 273 and cd.cd_hash <= 673
;

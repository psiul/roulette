select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,warehouse w,ship_mode sm,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 150 and hd.hd_hash <= 900 and sm.sm_hash >= 124 and sm.sm_hash <= 524 and cd.cd_hash >= 503 and cd.cd_hash <= 836
;

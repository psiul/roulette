select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,ship_mode sm,household_demographics hd
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 277 and cd.cd_hash <= 677 and sm.sm_hash >= 167 and sm.sm_hash <= 500 and hd.hd_hash >= 29 and hd.hd_hash <= 779
;

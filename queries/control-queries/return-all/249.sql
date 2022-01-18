select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer_demographics cd,warehouse w,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and hd.hd_hash >= 4 and hd.hd_hash <= 337 and cd.cd_hash >= 291 and cd.cd_hash <= 691 and sm.sm_hash >= 106 and sm.sm_hash <= 856
;

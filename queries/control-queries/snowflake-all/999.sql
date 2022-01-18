select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer_demographics cd,warehouse w,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 177 and cs.cs_hash <= 510 and hd.hd_hash >= 133 and hd.hd_hash <= 883 and sm.sm_hash >= 122 and sm.sm_hash <= 522
;

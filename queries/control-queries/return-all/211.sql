select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,household_demographics hd,customer_demographics cd,ship_mode sm
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 3 and cs.cs_hash <= 753 and hd.hd_hash >= 396 and hd.hd_hash <= 729 and sm.sm_hash >= 454 and sm.sm_hash <= 854
;

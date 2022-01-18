select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,household_demographics hd,warehouse w
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 27 and cs.cs_hash <= 360 and sm.sm_hash >= 409 and sm.sm_hash <= 809 and hd.hd_hash >= 41 and hd.hd_hash <= 791
;

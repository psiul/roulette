select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,household_demographics hd,ship_mode sm,warehouse w
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 261 and cs.cs_hash <= 661 and hd.hd_hash >= 134 and hd.hd_hash <= 467 and sm.sm_hash >= 212 and sm.sm_hash <= 962
;

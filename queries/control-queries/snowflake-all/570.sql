select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,customer_demographics cd,warehouse w
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 26 and cs.cs_hash <= 776 and sm.sm_hash >= 181 and sm.sm_hash <= 581 and cd.cd_hash >= 430 and cd.cd_hash <= 763
;

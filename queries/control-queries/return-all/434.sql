select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,ship_mode sm,household_demographics hd,customer_demographics cd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 161 and cs.cs_hash <= 561 and sm.sm_hash >= 190 and sm.sm_hash <= 523 and cd.cd_hash >= 183 and cd.cd_hash <= 933
;

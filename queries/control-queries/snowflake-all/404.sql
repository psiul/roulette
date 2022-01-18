select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer_demographics cd,ship_mode sm,warehouse w
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 34 and cs.cs_hash <= 784 and hd.hd_hash >= 115 and hd.hd_hash <= 448 and sm.sm_hash >= 280 and sm.sm_hash <= 680
;

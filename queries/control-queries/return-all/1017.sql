select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,ship_mode sm,household_demographics hd,customer c
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 91 and cs.cs_hash <= 841 and sm.sm_hash >= 371 and sm.sm_hash <= 771 and hd.hd_hash >= 368 and hd.hd_hash <= 701
;

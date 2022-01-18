select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,ship_mode sm,warehouse w,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 66 and cs.cs_hash <= 816 and hd.hd_hash >= 297 and hd.hd_hash <= 697 and sm.sm_hash >= 444 and sm.sm_hash <= 777
;

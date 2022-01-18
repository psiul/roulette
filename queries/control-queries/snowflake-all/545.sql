select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,warehouse w,ship_mode sm,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 87 and cs.cs_hash <= 837 and hd.hd_hash >= 543 and hd.hd_hash <= 876 and c.c_hash >= 530 and c.c_hash <= 930
;

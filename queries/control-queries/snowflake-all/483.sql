select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,warehouse w,ship_mode sm
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 181 and cs.cs_hash <= 931 and c.c_hash >= 365 and c.c_hash <= 698 and hd.hd_hash >= 149 and hd.hd_hash <= 549
;

select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,date_dim d,warehouse w
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 230 and cs.cs_hash <= 630 and sm.sm_hash >= 34 and sm.sm_hash <= 784 and hd.hd_hash >= 330 and hd.hd_hash <= 663
;

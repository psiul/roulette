select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer c,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 428 and cs.cs_hash <= 828 and d.d_hash >= 190 and d.d_hash <= 940 and sm.sm_hash >= 80 and sm.sm_hash <= 413
;

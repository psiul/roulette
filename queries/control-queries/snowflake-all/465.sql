select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,date_dim d,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 545 and cs.cs_hash <= 945 and sm.sm_hash >= 213 and sm.sm_hash <= 963 and hd.hd_hash >= 209 and hd.hd_hash <= 542
;

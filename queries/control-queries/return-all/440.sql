select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,customer c,date_dim d
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and sm.sm_hash >= 480 and sm.sm_hash <= 880 and c.c_hash >= 84 and c.c_hash <= 834 and d.d_hash >= 135 and d.d_hash <= 468
;

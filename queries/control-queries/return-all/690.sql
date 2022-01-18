select count(cs.cs_item_sk)
from catalog_sales cs,customer c,ship_mode sm,household_demographics hd,date_dim d
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 52 and cs.cs_hash <= 802 and c.c_hash >= 273 and c.c_hash <= 673 and d.d_hash >= 64 and d.d_hash <= 397
;

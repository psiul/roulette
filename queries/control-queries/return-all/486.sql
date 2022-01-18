select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,ship_mode sm,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 205 and cs.cs_hash <= 955 and d.d_hash >= 10 and d.d_hash <= 343 and sm.sm_hash >= 158 and sm.sm_hash <= 558
;

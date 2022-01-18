select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,ship_mode sm,date_dim d,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and hd.hd_hash >= 136 and hd.hd_hash <= 886 and sm.sm_hash >= 270 and sm.sm_hash <= 603 and d.d_hash >= 243 and d.d_hash <= 643
;

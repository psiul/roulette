select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,household_demographics hd,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and d.d_hash >= 86 and d.d_hash <= 419 and sm.sm_hash >= 541 and sm.sm_hash <= 941 and hd.hd_hash >= 199 and hd.hd_hash <= 949
;

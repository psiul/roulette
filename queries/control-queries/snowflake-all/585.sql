select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,date_dim d,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_hash >= 249 and c.c_hash <= 649 and d.d_hash >= 94 and d.d_hash <= 844 and sm.sm_hash >= 566 and sm.sm_hash <= 899
;

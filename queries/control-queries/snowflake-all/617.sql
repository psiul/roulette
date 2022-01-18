select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,ship_mode sm,customer c
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and d.d_hash >= 72 and d.d_hash <= 822 and sm.sm_hash >= 628 and sm.sm_hash <= 961 and c.c_hash >= 492 and c.c_hash <= 892
;

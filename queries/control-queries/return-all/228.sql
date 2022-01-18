select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,date_dim d,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and sm.sm_hash >= 35 and sm.sm_hash <= 785 and d.d_hash >= 454 and d.d_hash <= 854 and c.c_hash >= 492 and c.c_hash <= 825
;

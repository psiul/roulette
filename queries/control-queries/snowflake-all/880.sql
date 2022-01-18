select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,ship_mode sm,date_dim d
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and c.c_hash >= 305 and c.c_hash <= 638 and hd.hd_hash >= 87 and hd.hd_hash <= 837 and d.d_hash >= 553 and d.d_hash <= 953
;

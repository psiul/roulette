select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,customer c,household_demographics hd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 1 and cs.cs_hash <= 751 and d.d_hash >= 88 and d.d_hash <= 488 and hd.hd_hash >= 307 and hd.hd_hash <= 640
;

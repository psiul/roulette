select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,household_demographics hd,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and d.d_hash >= 531 and d.d_hash <= 864 and hd.hd_hash >= 246 and hd.hd_hash <= 996 and c.c_hash >= 512 and c.c_hash <= 912
;

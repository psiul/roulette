select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,date_dim d,ship_mode sm
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 158 and cs.cs_hash <= 558 and c.c_hash >= 43 and c.c_hash <= 793 and hd.hd_hash >= 66 and hd.hd_hash <= 399
;

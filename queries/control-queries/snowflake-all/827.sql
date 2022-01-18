select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,household_demographics hd,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 254 and cs.cs_hash <= 654 and c.c_hash >= 185 and c.c_hash <= 935 and hd.hd_hash >= 284 and hd.hd_hash <= 617
;

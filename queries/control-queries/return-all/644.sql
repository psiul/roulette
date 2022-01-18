select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,catalog_returns cr,ship_mode sm,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 238 and d.d_hash <= 988 and sm.sm_hash >= 66 and sm.sm_hash <= 466 and hd.hd_hash >= 129 and hd.hd_hash <= 462
;

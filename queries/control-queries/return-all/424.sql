select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,catalog_returns cr,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 485 and cs.cs_hash <= 818 and d.d_hash >= 34 and d.d_hash <= 434 and sm.sm_hash >= 6 and sm.sm_hash <= 756
;

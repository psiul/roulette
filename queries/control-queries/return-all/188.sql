select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,household_demographics hd,ship_mode sm,date_dim d
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_hash >= 522 and cs.cs_hash <= 922 and sm.sm_hash >= 189 and sm.sm_hash <= 522 and d.d_hash >= 61 and d.d_hash <= 811
;

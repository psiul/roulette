select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,date_dim d,catalog_returns cr
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 20 and cs.cs_hash <= 770 and sm.sm_hash >= 100 and sm.sm_hash <= 433 and d.d_hash >= 192 and d.d_hash <= 592
;

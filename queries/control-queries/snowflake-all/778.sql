select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,ship_mode sm,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 99 and cs.cs_hash <= 499 and d.d_hash >= 38 and d.d_hash <= 788 and i.i_hash >= 135 and i.i_hash <= 468
;

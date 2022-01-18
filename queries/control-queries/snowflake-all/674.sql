select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,ship_mode sm,item i,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and hd.hd_hash >= 60 and hd.hd_hash <= 810 and sm.sm_hash >= 524 and sm.sm_hash <= 924 and d.d_hash >= 12 and d.d_hash <= 345
;

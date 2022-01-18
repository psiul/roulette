select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,household_demographics hd,date_dim d
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and sm.sm_hash >= 104 and sm.sm_hash <= 437 and hd.hd_hash >= 203 and hd.hd_hash <= 953 and d.d_hash >= 366 and d.d_hash <= 766
;

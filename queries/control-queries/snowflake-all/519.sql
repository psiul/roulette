select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,household_demographics hd,item i
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and d.d_hash >= 494 and d.d_hash <= 894 and sm.sm_hash >= 217 and sm.sm_hash <= 550 and hd.hd_hash >= 224 and hd.hd_hash <= 974
;

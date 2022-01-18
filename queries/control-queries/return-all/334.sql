select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,item i,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and hd.hd_hash >= 26 and hd.hd_hash <= 776 and d.d_hash >= 524 and d.d_hash <= 924 and sm.sm_hash >= 177 and sm.sm_hash <= 510
;

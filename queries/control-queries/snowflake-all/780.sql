select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,item i,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 165 and d.d_hash <= 565 and i.i_hash >= 549 and i.i_hash <= 882 and sm.sm_hash >= 249 and sm.sm_hash <= 999
;

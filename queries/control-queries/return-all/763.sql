select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,date_dim d,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 21 and cs.cs_hash <= 354 and sm.sm_hash >= 140 and sm.sm_hash <= 540 and d.d_hash >= 132 and d.d_hash <= 882
;

select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,item i,household_demographics hd,date_dim d
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and sm.sm_hash >= 85 and sm.sm_hash <= 485 and i.i_hash >= 6 and i.i_hash <= 756 and d.d_hash >= 121 and d.d_hash <= 454
;

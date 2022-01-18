select count(cs.cs_item_sk)
from catalog_sales cs,item i,household_demographics hd,date_dim d,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 132 and cs.cs_hash <= 532 and d.d_hash >= 82 and d.d_hash <= 415 and sm.sm_hash >= 100 and sm.sm_hash <= 850
;

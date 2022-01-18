select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,item i,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 310 and cs.cs_hash <= 710 and sm.sm_hash >= 34 and sm.sm_hash <= 784 and i.i_hash >= 334 and i.i_hash <= 667
;

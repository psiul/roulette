select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,item i,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 491 and d.d_hash <= 824 and sm.sm_hash >= 196 and sm.sm_hash <= 946 and hd.hd_hash >= 401 and hd.hd_hash <= 801
;

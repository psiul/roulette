select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,ship_mode sm,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 283 and cs.cs_hash <= 683 and i.i_hash >= 222 and i.i_hash <= 555 and hd.hd_hash >= 98 and hd.hd_hash <= 848
;

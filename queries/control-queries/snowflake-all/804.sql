select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,item i,household_demographics hd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 304 and d.d_hash <= 704 and i.i_hash >= 437 and i.i_hash <= 770 and hd.hd_hash >= 20 and hd.hd_hash <= 770
;

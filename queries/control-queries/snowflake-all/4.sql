select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,item i,household_demographics hd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 384 and cs.cs_hash <= 717 and i.i_hash >= 574 and i.i_hash <= 974 and hd.hd_hash >= 69 and hd.hd_hash <= 819
;

select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,household_demographics hd,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 304 and cs.cs_hash <= 704 and i.i_hash >= 48 and i.i_hash <= 798 and sm.sm_hash >= 529 and sm.sm_hash <= 862
;

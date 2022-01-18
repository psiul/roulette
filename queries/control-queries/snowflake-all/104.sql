select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,date_dim d,item i
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and sm.sm_hash >= 64 and sm.sm_hash <= 814 and hd.hd_hash >= 422 and hd.hd_hash <= 755 and d.d_hash >= 201 and d.d_hash <= 601
;

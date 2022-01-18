select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,item i,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 238 and cs.cs_hash <= 638 and hd.hd_hash >= 203 and hd.hd_hash <= 536 and d.d_hash >= 0 and d.d_hash <= 750
;

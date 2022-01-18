select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,household_demographics hd,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 197 and d.d_hash <= 597 and i.i_hash >= 287 and i.i_hash <= 620 and hd.hd_hash >= 72 and hd.hd_hash <= 822
;

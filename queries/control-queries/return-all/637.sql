select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,ship_mode sm,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 337 and cs.cs_hash <= 737 and d.d_hash >= 61 and d.d_hash <= 811 and sm.sm_hash >= 465 and sm.sm_hash <= 798
;

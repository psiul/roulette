select count(cs.cs_item_sk)
from catalog_sales cs,item i,household_demographics hd,ship_mode sm,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and i.i_hash >= 270 and i.i_hash <= 670 and sm.sm_hash >= 172 and sm.sm_hash <= 922 and c.c_hash >= 205 and c.c_hash <= 538
;

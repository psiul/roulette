select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer c,item i,household_demographics hd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 643 and cs.cs_hash <= 976 and sm.sm_hash >= 212 and sm.sm_hash <= 612 and i.i_hash >= 137 and i.i_hash <= 887
;

select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,customer c,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 468 and i.i_hash <= 868 and sm.sm_hash >= 634 and sm.sm_hash <= 967 and c.c_hash >= 174 and c.c_hash <= 924
;

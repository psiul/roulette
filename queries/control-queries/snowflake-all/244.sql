select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,item i,household_demographics hd,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and i.i_hash >= 224 and i.i_hash <= 974 and hd.hd_hash >= 284 and hd.hd_hash <= 617 and c.c_hash >= 101 and c.c_hash <= 501
;

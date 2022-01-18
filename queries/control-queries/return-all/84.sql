select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,ship_mode sm,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 244 and cs.cs_hash <= 994 and hd.hd_hash >= 302 and hd.hd_hash <= 635 and sm.sm_hash >= 325 and sm.sm_hash <= 725
;

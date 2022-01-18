select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,customer c,item i
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and hd.hd_hash >= 175 and hd.hd_hash <= 575 and c.c_hash >= 56 and c.c_hash <= 389 and i.i_hash >= 66 and i.i_hash <= 816
;

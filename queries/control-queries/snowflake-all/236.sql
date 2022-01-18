select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer c,household_demographics hd,item i
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and sm.sm_hash >= 197 and sm.sm_hash <= 947 and c.c_hash >= 169 and c.c_hash <= 569 and hd.hd_hash >= 230 and hd.hd_hash <= 563
;

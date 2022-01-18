select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer c,customer_demographics cd,household_demographics hd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 108 and cs.cs_hash <= 858 and sm.sm_hash >= 413 and sm.sm_hash <= 813 and c.c_hash >= 118 and c.c_hash <= 451
;

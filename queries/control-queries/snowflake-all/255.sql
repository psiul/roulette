select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,ship_mode sm,customer c,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 462 and cs.cs_hash <= 862 and sm.sm_hash >= 175 and sm.sm_hash <= 925 and c.c_hash >= 88 and c.c_hash <= 421
;

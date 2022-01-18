select count(cs.cs_item_sk)
from catalog_sales cs,customer c,ship_mode sm,household_demographics hd,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 325 and cs.cs_hash <= 725 and c.c_hash >= 44 and c.c_hash <= 794 and cd.cd_hash >= 275 and cd.cd_hash <= 608
;

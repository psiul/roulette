select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,ship_mode sm,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 564 and cs.cs_hash <= 897 and sm.sm_hash >= 38 and sm.sm_hash <= 438 and cd.cd_hash >= 95 and cd.cd_hash <= 845
;

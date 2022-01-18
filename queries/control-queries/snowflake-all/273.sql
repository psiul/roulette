select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,ship_mode sm,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 236 and hd.hd_hash <= 636 and sm.sm_hash >= 271 and sm.sm_hash <= 604 and cd.cd_hash >= 91 and cd.cd_hash <= 841
;

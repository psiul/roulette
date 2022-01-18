select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer c,household_demographics hd,customer_demographics cd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 51 and cs.cs_hash <= 451 and sm.sm_hash >= 86 and sm.sm_hash <= 836 and cd.cd_hash >= 202 and cd.cd_hash <= 535
;

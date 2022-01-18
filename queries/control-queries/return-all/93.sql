select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,household_demographics hd,ship_mode sm,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 246 and cs.cs_hash <= 646 and cd.cd_hash >= 638 and cd.cd_hash <= 971 and hd.hd_hash >= 34 and hd.hd_hash <= 784
;

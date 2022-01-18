select count(cs.cs_item_sk)
from catalog_sales cs,customer c,ship_mode sm,household_demographics hd,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 18 and c.c_hash <= 351 and hd.hd_hash >= 409 and hd.hd_hash <= 809 and cd.cd_hash >= 142 and cd.cd_hash <= 892
;

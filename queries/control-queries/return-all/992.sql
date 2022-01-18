select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,ship_mode sm,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 185 and hd.hd_hash <= 935 and c.c_hash >= 38 and c.c_hash <= 438 and sm.sm_hash >= 549 and sm.sm_hash <= 882
;

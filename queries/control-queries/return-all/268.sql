select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,ship_mode sm,customer_demographics cd,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 30 and cs.cs_hash <= 430 and hd.hd_hash >= 200 and hd.hd_hash <= 950 and sm.sm_hash >= 149 and sm.sm_hash <= 482
;

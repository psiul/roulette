select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,customer_demographics cd,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and hd.hd_hash >= 433 and hd.hd_hash <= 766 and c.c_hash >= 161 and c.c_hash <= 911 and sm.sm_hash >= 60 and sm.sm_hash <= 460
;

select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,ship_mode sm,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 563 and cs.cs_hash <= 963 and i.i_hash >= 29 and i.i_hash <= 362 and sm.sm_hash >= 136 and sm.sm_hash <= 886
;

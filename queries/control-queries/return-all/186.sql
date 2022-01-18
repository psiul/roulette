select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,item i,customer_demographics cd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 420 and cs.cs_hash <= 820 and sm.sm_hash >= 257 and sm.sm_hash <= 590 and hd.hd_hash >= 140 and hd.hd_hash <= 890
;

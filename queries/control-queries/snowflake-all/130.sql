select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,customer_demographics cd,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 238 and cs.cs_hash <= 988 and i.i_hash >= 636 and i.i_hash <= 969 and cd.cd_hash >= 244 and cd.cd_hash <= 644
;

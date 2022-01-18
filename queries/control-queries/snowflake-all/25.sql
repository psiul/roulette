select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,household_demographics hd,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cd.cd_hash >= 563 and cd.cd_hash <= 963 and hd.hd_hash >= 135 and hd.hd_hash <= 885 and sm.sm_hash >= 616 and sm.sm_hash <= 949
;

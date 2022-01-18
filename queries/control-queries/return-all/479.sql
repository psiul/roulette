select count(cs.cs_item_sk)
from catalog_sales cs,item i,household_demographics hd,customer_demographics cd,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and i.i_hash >= 662 and i.i_hash <= 995 and hd.hd_hash >= 0 and hd.hd_hash <= 750 and cd.cd_hash >= 268 and cd.cd_hash <= 668
;

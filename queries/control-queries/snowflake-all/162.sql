select count(cs.cs_item_sk)
from catalog_sales cs,item i,household_demographics hd,customer_demographics cd,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 195 and cs.cs_hash <= 945 and i.i_hash >= 326 and i.i_hash <= 659 and sm.sm_hash >= 273 and sm.sm_hash <= 673
;

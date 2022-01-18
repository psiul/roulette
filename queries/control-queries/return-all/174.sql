select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,item i,customer_demographics cd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 193 and cs.cs_hash <= 943 and sm.sm_hash >= 400 and sm.sm_hash <= 800 and i.i_hash >= 638 and i.i_hash <= 971
;

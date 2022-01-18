select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,household_demographics hd,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and i.i_hash >= 621 and i.i_hash <= 954 and hd.hd_hash >= 329 and hd.hd_hash <= 729 and sm.sm_hash >= 226 and sm.sm_hash <= 976
;

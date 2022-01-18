select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,date_dim d,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and i.i_hash >= 4 and i.i_hash <= 754 and cd.cd_hash >= 40 and cd.cd_hash <= 373 and sm.sm_hash >= 463 and sm.sm_hash <= 863
;

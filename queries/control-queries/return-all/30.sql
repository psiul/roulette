select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer c,customer_demographics cd,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_hash >= 187 and c.c_hash <= 937 and cd.cd_hash >= 352 and cd.cd_hash <= 752 and sm.sm_hash >= 552 and sm.sm_hash <= 885
;

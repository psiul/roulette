select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,item i,customer_demographics cd,catalog_returns cr
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and sm.sm_hash >= 27 and sm.sm_hash <= 360 and i.i_hash >= 34 and i.i_hash <= 434 and cd.cd_hash >= 107 and cd.cd_hash <= 857
;

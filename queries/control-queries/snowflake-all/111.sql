select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer c,ship_mode sm,customer_demographics cd
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 508 and cs.cs_hash <= 908 and i.i_hash >= 0 and i.i_hash <= 750 and c.c_hash >= 582 and c.c_hash <= 915
;

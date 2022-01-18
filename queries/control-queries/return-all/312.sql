select count(cs.cs_item_sk)
from catalog_sales cs,customer c,ship_mode sm,item i,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 7 and cs.cs_hash <= 757 and c.c_hash >= 37 and c.c_hash <= 370 and cd.cd_hash >= 215 and cd.cd_hash <= 615
;

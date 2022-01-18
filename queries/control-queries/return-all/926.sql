select count(cs.cs_item_sk)
from catalog_sales cs,customer c,item i,customer_demographics cd,ship_mode sm
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 579 and cs.cs_hash <= 979 and i.i_hash >= 109 and i.i_hash <= 859 and cd.cd_hash >= 204 and cd.cd_hash <= 537
;

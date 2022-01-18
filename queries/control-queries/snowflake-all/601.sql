select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer_demographics cd,customer c,item i
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 323 and cs.cs_hash <= 656 and cd.cd_hash >= 69 and cd.cd_hash <= 819 and i.i_hash >= 475 and i.i_hash <= 875
;

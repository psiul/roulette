select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer c,item i,customer_demographics cd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 154 and cs.cs_hash <= 904 and sm.sm_hash >= 464 and sm.sm_hash <= 797 and cd.cd_hash >= 439 and cd.cd_hash <= 839
;

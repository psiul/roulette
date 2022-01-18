select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,customer c,ship_mode sm,item i
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 46 and cs.cs_hash <= 796 and sm.sm_hash >= 365 and sm.sm_hash <= 765 and i.i_hash >= 266 and i.i_hash <= 599
;

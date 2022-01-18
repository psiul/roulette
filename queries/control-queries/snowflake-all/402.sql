select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer_demographics cd,item i,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 388 and cs.cs_hash <= 721 and i.i_hash >= 249 and i.i_hash <= 999 and c.c_hash >= 261 and c.c_hash <= 661
;

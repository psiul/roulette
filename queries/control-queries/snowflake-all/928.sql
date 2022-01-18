select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_demographics cd,ship_mode sm,warehouse w
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 465 and cs.cs_hash <= 865 and cd.cd_hash >= 81 and cd.cd_hash <= 414 and sm.sm_hash >= 249 and sm.sm_hash <= 999
;

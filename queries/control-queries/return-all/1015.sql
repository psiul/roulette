select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer_demographics cd,ship_mode sm,customer c
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cd.cd_hash >= 537 and cd.cd_hash <= 937 and sm.sm_hash >= 78 and sm.sm_hash <= 828 and c.c_hash >= 512 and c.c_hash <= 845
;

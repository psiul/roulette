select count(cs.cs_item_sk)
from catalog_sales cs,customer c,ship_mode sm,customer_demographics cd,warehouse w
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 169 and cs.cs_hash <= 919 and c.c_hash >= 519 and c.c_hash <= 919 and sm.sm_hash >= 402 and sm.sm_hash <= 735
;

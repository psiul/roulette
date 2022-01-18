select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,catalog_returns cr,warehouse w
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 279 and cs.cs_hash <= 612 and cd.cd_hash >= 568 and cd.cd_hash <= 968 and sm.sm_hash >= 91 and sm.sm_hash <= 841
;

select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,warehouse w,customer_demographics cd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and sm.sm_hash >= 104 and sm.sm_hash <= 504 and d.d_hash >= 21 and d.d_hash <= 771 and cd.cd_hash >= 663 and cd.cd_hash <= 996
;

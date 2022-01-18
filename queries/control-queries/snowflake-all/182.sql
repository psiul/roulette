select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,warehouse w,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 68 and cs.cs_hash <= 818 and d.d_hash >= 178 and d.d_hash <= 511 and cd.cd_hash >= 244 and cd.cd_hash <= 644
;

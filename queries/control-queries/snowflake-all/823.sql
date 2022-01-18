select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,warehouse w,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 17 and cs.cs_hash <= 767 and d.d_hash >= 5 and d.d_hash <= 405 and cd.cd_hash >= 34 and cd.cd_hash <= 367
;

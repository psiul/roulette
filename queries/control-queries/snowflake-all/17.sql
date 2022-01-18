select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,ship_mode sm,date_dim d,customer_demographics cd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 160 and cs.cs_hash <= 910 and d.d_hash >= 431 and d.d_hash <= 831 and cd.cd_hash >= 180 and cd.cd_hash <= 513
;

select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,warehouse w,date_dim d,customer_demographics cd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 203 and cs.cs_hash <= 536 and sm.sm_hash >= 249 and sm.sm_hash <= 999 and d.d_hash >= 588 and d.d_hash <= 988
;

select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer_demographics cd,ship_mode sm,date_dim d
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cd.cd_hash >= 195 and cd.cd_hash <= 945 and sm.sm_hash >= 153 and sm.sm_hash <= 553 and d.d_hash >= 330 and d.d_hash <= 663
;

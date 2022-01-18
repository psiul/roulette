select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer_demographics cd,ship_mode sm,date_dim d
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 228 and cs.cs_hash <= 628 and sm.sm_hash >= 43 and sm.sm_hash <= 793 and d.d_hash >= 350 and d.d_hash <= 683
;

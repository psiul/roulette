select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,warehouse w,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 164 and cs.cs_hash <= 914 and d.d_hash >= 187 and d.d_hash <= 587 and sm.sm_hash >= 383 and sm.sm_hash <= 716
;

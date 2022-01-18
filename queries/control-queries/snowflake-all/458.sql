select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,warehouse w,date_dim d,customer_demographics cd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 421 and cs.cs_hash <= 821 and sm.sm_hash >= 208 and sm.sm_hash <= 958 and d.d_hash >= 251 and d.d_hash <= 584
;

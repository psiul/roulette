select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,item i,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 3 and cs.cs_hash <= 403 and cd.cd_hash >= 553 and cd.cd_hash <= 886 and sm.sm_hash >= 215 and sm.sm_hash <= 965
;

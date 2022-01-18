select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,item i,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cd.cd_hash >= 548 and cd.cd_hash <= 881 and i.i_hash >= 412 and i.i_hash <= 812 and d.d_hash >= 239 and d.d_hash <= 989
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,item i,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cd.cd_hash >= 258 and cd.cd_hash <= 658 and i.i_hash >= 476 and i.i_hash <= 809 and sm.sm_hash >= 229 and sm.sm_hash <= 979
;

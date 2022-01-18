select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,item i,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cd.cd_hash >= 200 and cd.cd_hash <= 533 and d.d_hash >= 101 and d.d_hash <= 501 and sm.sm_hash >= 131 and sm.sm_hash <= 881
;

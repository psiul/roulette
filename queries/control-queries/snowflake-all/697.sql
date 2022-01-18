select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,item i,customer_demographics cd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 107 and d.d_hash <= 857 and sm.sm_hash >= 173 and sm.sm_hash <= 573 and cd.cd_hash >= 198 and cd.cd_hash <= 531
;

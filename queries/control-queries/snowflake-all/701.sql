select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,item i,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cd.cd_hash >= 125 and cd.cd_hash <= 525 and d.d_hash >= 191 and d.d_hash <= 941 and i.i_hash >= 11 and i.i_hash <= 344
;

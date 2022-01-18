select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,customer_demographics cd,date_dim d
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 20 and cs.cs_hash <= 353 and i.i_hash >= 68 and i.i_hash <= 818 and cd.cd_hash >= 22 and cd.cd_hash <= 422
;

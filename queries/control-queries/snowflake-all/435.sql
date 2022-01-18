select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,ship_mode sm,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and d.d_hash >= 380 and d.d_hash <= 713 and cd.cd_hash >= 0 and cd.cd_hash <= 750 and i.i_hash >= 236 and i.i_hash <= 636
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,ship_mode sm,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 138 and d.d_hash <= 888 and sm.sm_hash >= 456 and sm.sm_hash <= 856 and cd.cd_hash >= 230 and cd.cd_hash <= 563
;

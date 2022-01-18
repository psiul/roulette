select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,date_dim d,customer_demographics cd
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and sm.sm_hash >= 234 and sm.sm_hash <= 984 and d.d_hash >= 474 and d.d_hash <= 874 and cd.cd_hash >= 299 and cd.cd_hash <= 632
;

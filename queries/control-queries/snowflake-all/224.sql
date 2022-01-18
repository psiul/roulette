select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,customer_demographics cd,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 104 and d.d_hash <= 854 and cd.cd_hash >= 490 and cd.cd_hash <= 890 and sm.sm_hash >= 462 and sm.sm_hash <= 795
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,customer_demographics cd,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 579 and cs.cs_hash <= 912 and i.i_hash >= 105 and i.i_hash <= 855 and cd.cd_hash >= 6 and cd.cd_hash <= 406
;

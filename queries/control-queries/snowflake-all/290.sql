select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer_demographics cd,item i,date_dim d
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 161 and cs.cs_hash <= 494 and i.i_hash >= 186 and i.i_hash <= 936 and d.d_hash >= 360 and d.d_hash <= 760
;

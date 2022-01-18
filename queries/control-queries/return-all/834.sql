select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,customer_demographics cd,date_dim d
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 241 and cs.cs_hash <= 991 and i.i_hash >= 610 and i.i_hash <= 943 and sm.sm_hash >= 235 and sm.sm_hash <= 635
;

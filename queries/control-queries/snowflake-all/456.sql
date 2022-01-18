select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer_demographics cd,date_dim d,item i
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 15 and cs.cs_hash <= 765 and d.d_hash >= 163 and d.d_hash <= 563 and i.i_hash >= 347 and i.i_hash <= 680
;

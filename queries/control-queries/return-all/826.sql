select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,item i,customer_demographics cd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and sm.sm_hash >= 367 and sm.sm_hash <= 767 and d.d_hash >= 73 and d.d_hash <= 823 and i.i_hash >= 550 and i.i_hash <= 883
;

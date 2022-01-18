select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,date_dim d,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 149 and cs.cs_hash <= 899 and i.i_hash >= 438 and i.i_hash <= 838 and d.d_hash >= 74 and d.d_hash <= 407
;

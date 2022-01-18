select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,date_dim d,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 555 and cs.cs_hash <= 888 and d.d_hash >= 153 and d.d_hash <= 903 and sm.sm_hash >= 326 and sm.sm_hash <= 726
;

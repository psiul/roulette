select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,ship_mode sm,item i
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and d.d_hash >= 275 and d.d_hash <= 608 and sm.sm_hash >= 156 and sm.sm_hash <= 906 and i.i_hash >= 215 and i.i_hash <= 615
;

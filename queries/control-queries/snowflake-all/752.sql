select count(cs.cs_item_sk)
from catalog_sales cs,customer c,ship_mode sm,customer_demographics cd,date_dim d
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and c.c_hash >= 225 and c.c_hash <= 975 and sm.sm_hash >= 27 and sm.sm_hash <= 427 and cd.cd_hash >= 115 and cd.cd_hash <= 448
;

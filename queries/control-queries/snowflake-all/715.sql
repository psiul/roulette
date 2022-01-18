select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,customer c,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cd.cd_hash >= 118 and cd.cd_hash <= 518 and d.d_hash >= 471 and d.d_hash <= 804 and sm.sm_hash >= 170 and sm.sm_hash <= 920
;

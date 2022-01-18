select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,date_dim d,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 208 and cs.cs_hash <= 958 and sm.sm_hash >= 89 and sm.sm_hash <= 422 and c.c_hash >= 226 and c.c_hash <= 626
;

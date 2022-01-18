select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer c,date_dim d,customer_demographics cd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 609 and cs.cs_hash <= 942 and c.c_hash >= 85 and c.c_hash <= 485 and cd.cd_hash >= 176 and cd.cd_hash <= 926
;

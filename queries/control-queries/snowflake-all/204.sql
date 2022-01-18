select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,date_dim d,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 119 and cs.cs_hash <= 869 and cd.cd_hash >= 554 and cd.cd_hash <= 954 and c.c_hash >= 545 and c.c_hash <= 878
;

select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,customer_demographics cd,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and d.d_hash >= 551 and d.d_hash <= 951 and cd.cd_hash >= 115 and cd.cd_hash <= 865 and c.c_hash >= 413 and c.c_hash <= 746
;

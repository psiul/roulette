select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,customer c,ship_mode sm,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 221 and cs.cs_hash <= 621 and c.c_hash >= 104 and c.c_hash <= 854 and d.d_hash >= 396 and d.d_hash <= 729
;

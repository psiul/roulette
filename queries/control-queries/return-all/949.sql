select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_demographics cd,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 171 and d.d_hash <= 921 and c.c_hash >= 212 and c.c_hash <= 612 and sm.sm_hash >= 202 and sm.sm_hash <= 535
;

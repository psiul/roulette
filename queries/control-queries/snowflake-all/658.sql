select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_demographics cd,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 88 and cs.cs_hash <= 838 and cd.cd_hash >= 220 and cd.cd_hash <= 620 and sm.sm_hash >= 498 and sm.sm_hash <= 831
;

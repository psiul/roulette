select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,customer c,customer_demographics cd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and sm.sm_hash >= 589 and sm.sm_hash <= 989 and d.d_hash >= 203 and d.d_hash <= 953 and cd.cd_hash >= 664 and cd.cd_hash <= 997
;

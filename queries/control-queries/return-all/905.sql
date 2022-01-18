select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,customer c,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 516 and cs.cs_hash <= 849 and sm.sm_hash >= 440 and sm.sm_hash <= 840 and c.c_hash >= 28 and c.c_hash <= 778
;

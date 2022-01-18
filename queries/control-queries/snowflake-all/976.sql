select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,customer c,date_dim d,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cd.cd_hash >= 518 and cd.cd_hash <= 918 and d.d_hash >= 417 and d.d_hash <= 750 and sm.sm_hash >= 96 and sm.sm_hash <= 846
;
